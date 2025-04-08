//
//  createViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 16/03/2025.
//


import Observation
import SwiftUI
import Photos


@Observable
class createViewModel {
    var showCreateBoard : Bool = false
    var boardName : String = ""
    var isSecretBoard : Bool = false
    var showAddPinView : Bool = false
    var isSelectedTab = "Photos"
    var showFullScreenPhotoGallery : Bool = false
    var pin : [Item] = [.init(id: UUID().uuidString, item_Name: "Funny cat", isSelected: false,     imageName: "habibi"),
                        .init(id: UUID().uuidString, item_Name: "Tom funny", isSelected: false, imageName: "confused"),
                        .init(id: UUID().uuidString, item_Name: "Quagmire", isSelected: false, imageName: "baldmire"),
                        .init(id: UUID().uuidString, item_Name: "Family guy", isSelected: false, imageName: "peta"),
                        .init(id: UUID().uuidString, item_Name: "Tom & jerry", isSelected: false, imageName: "hungrytom")]
    
    
    var tabs = ["All", "Videos", "Photos"]
    var gridItems = [
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1),
        GridItem(.flexible(), spacing: 1)
    ]
    var photoAssests: [PHAsset] = []
    func photoPermission () {
        PHPhotoLibrary.requestAuthorization(for: .readWrite){ status in
            DispatchQueue.main.async{
                if status == .authorized {
                    self.fetechPhoto()
                }
            }
        }
    }
    private func fetechPhoto () {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "Creations Date", ascending: false)]
        var fetchResult : PHFetchResult<PHAsset>
        switch isSelectedTab {
        case "Videos":
            fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions)
        case "Photos":
            fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        default:
            fetchResult = PHAsset.fetchAssets(with : fetchOptions)
        }
        photoAssests = fetchResult.objects(at: IndexSet(0 ..< fetchResult.count))
    }
}
