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
    var items: [Item] = [
        .init(
            id: UUID().uuidString,
            item_Name: "Blue Wallpaper",
            isSelected : false,
            imageName : ""
        ),
        
        .init(
            id: UUID().uuidString,
            item_Name: "Beach Pictures",
            isSelected : false,
            imageName : ""
        )
        ,
        .init(
            id: UUID().uuidString,
            item_Name: "Dp for what'sApp",
            isSelected : false,
            imageName : ""
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "Purple aesthetics",
            isSelected : false,
            imageName : ""
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "Selfie poses",
            isSelected : false,
            imageName : ""
        ),
        .init(
            id: UUID().uuidString,
            item_Name: "Easy dinner recipe",
            isSelected : false,
            imageName : ""
        )
    ]
}
