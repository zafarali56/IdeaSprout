//
//  HomeViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 19/03/2025.
//

import Foundation
import Observation

@Observable
class homeViewModel {
	var items : [Item] = [
    ]
	func loadPins () async throws {
		items = try await userService.shared.fetchPins()
	}
}
