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
	var createPinView: Bool = false
	var selectedImages : [UIImage] = [
	]
    var showCreateBoard : Bool = false
    var boardName : String = ""
    var isSecretBoard : Bool = false
    var showAddPinView : Bool = false
    var isSelectedTab = "Photos"
    var searchText: String = ""
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
    var topicGridItem: Array<GridItem> = [
        GridItem(.flexible(),spacing: 8),
        GridItem(.flexible(),spacing: 8)
    ]
    private var allTopics: Array<String> = [
        "Home Decor",
        "DIY Crafts",
        "Travel Destinations",
        "Healthy Recipes",
        "Fitness Workouts",
        "Fashion Inspiration",
        "Beauty Tips",
        "Wedding Ideas",
        "Gardening",
        "Photography",
        "Art and Illustration",
        "Motivational Quotes",
        "Technology Gadgets",
        "Parenting Tips",
        "Pet Care",
        "Outdoor Adventures",
        "Minimalist Living",
        "Sustainable Living",
        "Holiday Decorations",
        "Birthday Party Ideas",
        "Small Business Tips",
        "Marketing Strategies",
        "Interior Design",
        "Kitchen Organization",
        "Study Hacks",
        "Finance and Budgeting",
        "Career Advice",
        "Self-Care Rituals",
        "Book Recommendations",
        "Gaming Setups",
        "Music Playlists",
        "Movie Night Ideas",
        "Coffee Recipes",
        "Car Enthusiasts",
        "Anime and Manga",
        "Streetwear Fashion",
        "Camping and Hiking",
        "Jewelry Making",
        "Painting Tutorials",
        "Pottery and Ceramics",
        "Surfing and Beach Life"
    ]
    var displayTopics: Array<String> {
        var topics = Array(selectedTopics)
        let nonSelectedFilteredTopics = allTopics.filter{topic in
            topic.lowercased().contains(searchText.lowercased()) && !selectedTopics.contains(topic)
        }
        topics.append(contentsOf: nonSelectedFilteredTopics)
        return topics
    }
    var showTagTopics : Bool = false
    var tag : String = ""
    var boardSheetPresented : Bool = false
    var selectedTopics : Set<String> = []
    var selectedBoard : String = "Profile"
    var title: String = ""
    var description : String = ""
    var link: String = ""
    var photoAssests: [PHAsset] = []
    var selectedPhotos: Set<String> = []
    func photoPermission () {
        PHPhotoLibrary.requestAuthorization(for: .readWrite){ status in
            DispatchQueue.main.async{
                if status == .authorized {
                    self.fetechPhoto()
                }
            }
        }
    }
    func fetechPhoto () {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
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
    func toggleSelection (_ topic : String){
        if selectedTopics.contains(topic){
            selectedTopics.remove(topic)
        }else{
            selectedTopics.insert(topic)
        }
    }
	
	func uploadPin () async throws{
		try await userService.shared.uploadPin(itemName: title, description: description, link: link, uiImage: selectedImages[0])
	}
}
