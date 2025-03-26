//
//  logginOption.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 26/03/2025.
//

import Foundation
enum logginOption: Int,CaseIterable,Identifiable{
    var id : Int {return self.rawValue}
    case addAccount
    case security
    case logout
    

    var title: String {
        switch self {
        case .addAccount:
            return "Account view"
        case .security:
            return "Security"
        case .logout:
            return "Logout"
        }
    }
}
