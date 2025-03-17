//
//  notificationViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import Foundation
import Observation
enum notificationTabSelection {
    case Update
    case Inbox
}

@Observable
class notificationViewModel{
    var tabSelection : notificationTabSelection = .Update
    
}
