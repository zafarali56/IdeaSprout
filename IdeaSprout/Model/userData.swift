//
//  userData.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 27/04/2025.
//

import Foundation


struct UserData: Identifiable,Hashable, Codable{
    let id : String
    var email: String
    var name: String
    var gender: String
    var birthDate: String
    var interests: [interests]
    var pins: [Item]
    var board: [Board]
}
