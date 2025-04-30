//
//  authService.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 27/04/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import Firebase
import Observation
import GoogleSignIn

@Observable
class AuthService{
    static let shared  = AuthService()
    var userSession: FirebaseAuth.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func createUser(email: String, password: String,name: String,  gender: String, birthDate: String, selectedInterests: [interests]) async throws{
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            try await uploadUserData(email: email, id: result.user.uid, name: name, gender: gender, birthDate: birthDate, selectedInterests: selectedInterests)
        }
        catch{
            print("failed to create user \(error.localizedDescription)")
        }
    }
    @MainActor
    private func uploadUserData (email: String, id: String, name: String,gender: String, birthDate: String, selectedInterests: [interests]) async throws { let user = UserData(
        id: id, email: email, name: name, gender: gender, birthDate: birthDate, interests: selectedInterests, pins: [], board: [])
        guard let userData = try? Firestore.Encoder().encode(user) else {
            return
        }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
    }
	func signOut (){
		try? Auth.auth().signOut()
		self.userSession = nil
		userService.shared.reset()
	}
	func checkIfEmailExists (email: String) async -> Bool {
		do {
			let querySnapShot = try await Firestore.firestore().collection("users").whereField("email", isEqualTo: email).getDocuments()
			
			return !querySnapShot.isEmpty
		} catch {
			print("error \(error.localizedDescription)")
			return false
		}
	}
	@MainActor
	func login (email: String, password: String)async throws{
		do {
			let result = try await Auth.auth().signIn(withEmail: email, password: password)
			self.userSession = result.user
			try await userService.shared.fetchCurrentUserData()
		} catch{
			print("Failed to login\(error.localizedDescription)")
		}
	}
}
extension AuthService {
	func signIn (credentials : AuthCredential) async throws -> User{
		let authDataResult = try await Auth.auth().signIn(with: credentials)
		return authDataResult.user
	}
	func singInWithGoogle (tokens: GoogleSigninResultModel)async throws{
		do {
			let credentials = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
			self.userSession = try await signIn(credentials: credentials)
			if let email = userSession?.email{
				if await !checkIfEmailExists(email: email){
					try await uploadUserData(email: userSession?.email ?? "", id: userSession?.uid ?? UUID().uuidString, name: userSession?.displayName ?? "", gender: "", birthDate: "", selectedInterests: [])
				}else {
					try await userService.shared.fetchCurrentUserData()
				}
			}
		}
		catch{
			print("Error during google Signin \(error.localizedDescription)")
		}
	}
}
