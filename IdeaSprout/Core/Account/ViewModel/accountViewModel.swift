//
//  accountViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/04/2025.
//

import Foundation
import Observation


@Observable
class accountViewModel {
	
	
	func signOut() {
		AuthService.shared.signOut()
	}
}
