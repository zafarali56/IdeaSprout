//
//  createViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 16/03/2025.
//

import Foundation
import Observation


@Observable
class createViewModel {
    var showCreateBoard : Bool = false
    var boardName : String = ""
    var isSecretBoard : Bool = false
    var showAddPinView : Bool = false
    
    var pin : [Item] = [.init(id: UUID().uuidString, item_Name: "Funny cat", isSelected: false,     imageName: "habibi"),
                        .init(id: UUID().uuidString, item_Name: "Tom funny", isSelected: false, imageName: "confused"),
                        .init(id: UUID().uuidString, item_Name: "Quagmire", isSelected: false, imageName: "baldmire"),
                        .init(id: UUID().uuidString, item_Name: "Family guy", isSelected: false, imageName: "peta"),
                        .init(id: UUID().uuidString, item_Name: "Tom & jerry", isSelected: false, imageName: "hungrytom")]
    
}
