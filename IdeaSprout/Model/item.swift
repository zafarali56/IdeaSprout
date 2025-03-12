//
//  item.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 12/03/2025.
//

import Foundation


struct Item : Identifiable, Hashable, Codable {
    let id : String
    let item_Name : String
    var item_Description : String?
    var link : String?
    var isSelected : Bool
    var uid : String?
    var imageName : String
}
