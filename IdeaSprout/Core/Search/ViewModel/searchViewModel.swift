//
//  searchViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 12/03/2025.
//

import Foundation
import Observation
@Observable
class searchViewModel {
    var searchTerm : String = ""
    var title : String = "Search for memes"
    
    var items: [Item] = [
        .init(
            id: UUID().uuidString,
            item_Name: "New",
            isSelected : false,
            imageName : "memes"
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "Recently added",
            isSelected : false,
            imageName : "op"
        )
        ,
        .init(
            id: UUID().uuidString,
            item_Name: "Sigma memes",
            isSelected : false,
            imageName : "sigma"
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "Swift",
            isSelected : false,
            imageName : "swiftLang"
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "latest",
            isSelected : false,
            imageName : "catmeme"
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "You Favourites",
            isSelected : false,
            imageName : "actually"
        )
    ]
    
    var filteredItems : [Item] {
        if searchTerm.isEmpty {
            return items
        }
        return items
            .filter{$0.item_Name.localizedCaseInsensitiveContains(searchTerm)}
    }
}
