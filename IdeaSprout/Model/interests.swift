//
//  interests.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 07/04/2025.
//

import Foundation

struct interests: Identifiable, Hashable, Codable {
    let id : String
    var itemName: String
    var imageName: String
    var isSelected: Bool
}
