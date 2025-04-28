//
//  rootViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/04/2025.
//

import Foundation
import Observation
import FirebaseAuth

@Observable
class RootViewModel{
	var userSession : FirebaseAuth.User? {
		AuthService.shared.userSession
	}
}
