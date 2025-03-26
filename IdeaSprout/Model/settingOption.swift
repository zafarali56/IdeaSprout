//
//  settingOption.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 26/03/2025.
//

import Foundation

enum settingOption: Int,CaseIterable,Identifiable {
    case accountManagement
    case profileVisibility
    case homeFeedTuner
    case claimedAccounts
    case socialPermission
    case notifcations
    case privacyAndData
    case reportAndVoilation
    
    var id: Int { return self.rawValue}
    
    var title : String{
        switch self {
        case .accountManagement:
            return "Account managment"
        case .profileVisibility:
            return "Profile visbility"
        case .homeFeedTuner:
            return "Home feed tuner"
        case .claimedAccounts:
            return "Claimed account"
        case .socialPermission:
            return "Social permission"
        case .notifcations:
            return "Notification"
        case .privacyAndData:
            return "Privacy and data"
        case .reportAndVoilation:
            return "Reports and voilation center"
        }
    }
}
