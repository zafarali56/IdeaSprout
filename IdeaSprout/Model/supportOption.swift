//
//  supportOption.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 26/03/2025.
//

import Foundation
enum supportOption: Int, CaseIterable, Identifiable{
   
    case help
    case termsAndService
    case privacyPolicy
    case about
    
    
    var id :Int {return self.rawValue}
    var title: String{
        switch self {
        case .help:
            return "Help center"
        case .termsAndService:
            return "Terms and services"
        case .privacyPolicy:
            return "Privacy and policy"
        case .about:
            return "About us"
        }
    }
}
