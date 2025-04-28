//
//  userService.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/04/2025.
//

import Foundation
import Observation
import FirebaseAuth
import Firebase

@Observable
class userService {
	var currentUserData : UserData?
	static let shared = userService()
	init (){
		Task {
			try await fetchCurrentUserData()
		}
	}
	
	
	func fetchCurrentUserData() async throws {
		guard let uid = Auth.auth().currentUser?.uid else{
			return
		}
		
		let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
		
		self.currentUserData = try snapShot.data(as: UserData.self)
	}
	
	func reset (){
		self.currentUserData = nil
	}
}
