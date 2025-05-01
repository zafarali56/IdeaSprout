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
	func uploadPin (itemName: String, description: String?, link : String?, uiImage: UIImage?)async throws{
		guard let userId = Auth.auth().currentUser?.uid else {return}
		guard let uiImage = uiImage else {return}
		guard let imageUrl = try await ImageUploader.uploadCreatePinImage(uiImage) else {return}
		let pinRef = Firestore.firestore().collection("pins").document()
		let pin = Item(id: userId, item_Name: itemName, item_Description: description, link: link, isSelected: false, imageName:imageUrl)
		guard let encodedPin = try? Firestore.Encoder().encode(pin) else { return}
		try await pinRef.setData(encodedPin)
	}
}
