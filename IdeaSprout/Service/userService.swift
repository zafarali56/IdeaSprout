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
		let pin = Item(id: pinRef.documentID, item_Name: itemName, item_Description: description, link: link, isSelected: false, uid: userId, imageName:imageUrl)
		guard let encodedPin = try? Firestore.Encoder().encode(pin) else { return}
		try await pinRef.setData(encodedPin)
	}
	
	func fetchPins () async throws -> [Item] {
		let snapShot = try await Firestore.firestore().collection("pins").getDocuments()
		let pins = try  snapShot.documents.compactMap({try $0.data(as: Item.self)})
		return pins
	}
	@MainActor
	func uploadBoard(boardName: String, pinId: [String], tags: [String], isSecret: Bool ) async throws{
		guard let userId = Auth.auth().currentUser?.uid else {return}
		let boardRef = Firestore.firestore().collection("boards").document()
		let board = Board(id: boardRef.documentID, boardName: boardName, pinId: pinId, tags: tags, isSecret: isSecret, uid: userId )
		guard let enCodedBoard = try? Firestore.Encoder().encode(board) else {return}
		try await boardRef.setData(enCodedBoard)
	}
}
