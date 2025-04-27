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
}
