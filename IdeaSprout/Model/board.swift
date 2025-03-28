//
//  board.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/03/2025.
//

import Foundation
struct Board : Identifiable, Hashable, Codable{
    let id : String
    var boardName: String
    var pinId: [String]
    var tags: [String]?
    var isSecret : Bool
    var uid: String?
}
