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
    
    var items : [Item] = [
        .init(id: UUID().uuidString, item_Name: "cat meme", isSelected: false, imageName: "post1"),
        .init(id: UUID().uuidString, item_Name: "spongbob", isSelected: false, imageName: "post2"),
        .init(id: UUID().uuidString, item_Name: "chad", isSelected: false, imageName: "post3"),
        .init(id: UUID().uuidString, item_Name: "sad wojak", isSelected: false, imageName: "post4"),
        .init(id: UUID().uuidString, item_Name: "steve rogers", isSelected: false, imageName: "post5"),
        .init(id: UUID().uuidString, item_Name: "avenger", isSelected: false, imageName: "post6"),
        .init(id: UUID().uuidString, item_Name: "thanos", isSelected: false, imageName: "post7"),
        .init(id: UUID().uuidString, item_Name: "obi wan", isSelected: false, imageName: "post8"),
        .init(id: UUID().uuidString, item_Name: "avenger endgame", isSelected: false, imageName: "post9"),
        
    ]
}
