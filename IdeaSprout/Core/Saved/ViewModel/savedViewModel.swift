//
//  savedViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 21/03/2025.
//

import Foundation
import Observation

enum savedTabSelection{
    case pin
    case board
}


@Observable
class savedViewModel{
    var tabSelection : savedTabSelection = .pin
    var userName : String = "Walter white"
    var searchTerm : String = ""
    
    
    var items : [Item] = []
    var boardWithPins : [(Board, [Item])] = []
	init()
	{
		Task{
			try await loadCurrentUserPins()
			try await loadCurrentUserPins()
		}
	}
	func loadCurrentUserPins () async throws{
		items = try await userService.shared.fetchCurrentUserPins()
	}
	
	func loadCurrentBoardWithPins () async throws{
		boardWithPins = try await userService.shared.fetchCurrentUserBoardsWithPins()
	}
}
