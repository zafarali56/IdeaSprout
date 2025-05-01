//
//  fullScreenPhotoGalleryView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 08/04/2025.
//


import SwiftUI
import Photos

struct fullScreenPhotoGalleryView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel: createViewModel
    
    init(viewModel: createViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                        }
                        Spacer()
						Button("Next", action: {viewModel.createPinView.toggle()})
                            .foregroundStyle(.red)
                            .fontWeight(.semibold)
                    }
                    
                    Text("All photos")
                        .font(.headline)
                }
                .padding(.horizontal)
                .padding(.vertical)
                
                GalleryTabBar(
                    tabs: viewModel.tabs,
                    selectedTab: $viewModel.isSelectedTab,
                    onTabSelected: { _ in
                        viewModel.fetechPhoto()
                    }
                )
                
                ScrollView {
                    LazyVGrid(columns: viewModel.gridItems, spacing: 1) {
                        ForEach(viewModel.photoAssests, id: \.localIdentifier) { asset in
                            photoThumbnailView(
                                asset: asset,
                                size: proxy.size.width / 3,
                                isSelected: viewModel.selectedPhotos.contains(asset.localIdentifier)
                            )
                            .onTapGesture {
                                let id = asset.localIdentifier
                                if viewModel.selectedPhotos.contains(id) {
                                    viewModel.selectedPhotos.remove(id)
                                } else {
                                    viewModel.selectedPhotos.insert(id)
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    viewModel.photoPermission()
                }
                .padding(.top,5)
                .scrollIndicators(.hidden)
				.fullScreenCover(isPresented: $viewModel.createPinView, content: {
					createPinView(viewModel: viewModel, selectedAsset: viewModel.photoAssests.filter{
						viewModel.selectedPhotos.contains($0
							.localIdentifier
						)
					})
				})
                if !viewModel.selectedPhotos.isEmpty {
                    SelectedPhotoBar(selectedAssest: viewModel.photoAssests.filter {
                        viewModel.selectedPhotos.contains($0.localIdentifier)
                    }, onRemove: {asset in
                        viewModel.selectedPhotos.remove(asset.localIdentifier)
                        
                    })
                }
            }
        }
    }
}

struct GalleryTabBar: View {
    let tabs: [String]
    @Binding var selectedTab: String
    let onTabSelected: (String) -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(tabs, id: \.self) { tab in
                VStack(spacing: 2) {
                    Text(tab)
                        .foregroundStyle(selectedTab == tab ? .black : .gray)
                    Rectangle()
                        .fill(selectedTab == tab ? .black : .clear)
                        .frame(height: 2)
                }
                .onTapGesture {
                    selectedTab = tab
                    onTabSelected(tab)
                }
            }
        }
    }
}

struct SelectedPhotoBar : View {
    let selectedAssest : [PHAsset]
    let onRemove : (PHAsset)-> Void
    var body: some View {
        VStack(spacing: 0, content: {
            Divider()
            ScrollView(.horizontal, content: {
                HStack( spacing: 8, content: {
                    ForEach (selectedAssest, id:\.localIdentifier){asset in
                        SelectedphotoThumbnailView(asset: asset, size: 70, onRemove: {onRemove(asset)})
                    }
                }).padding(.horizontal)
                    .padding(.vertical)
                
            })
        })
    }
}

struct SelectedphotoThumbnailView : View {
    let asset : PHAsset
    let size : CGFloat
    let onRemove: ()-> Void
    
    @State private var image: UIImage?
    private let imageManager = PHCachingImageManager()
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            Button(action: {
                onRemove()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.red)
                    .background(Circle().fill(Color.white))
                    .font(.system(size: 18))
                    .padding(5)
            })
            
            
            
        })
        .onAppear{
            loadImage()
            
        }
    }
    func loadImage (){
        let options = PHImageRequestOptions()
        options.deliveryMode = .opportunistic
        options.isNetworkAccessAllowed = true
        options.resizeMode = .fast
        imageManager.requestImage(for: asset, targetSize: CGSize(width: size, height: size), contentMode: .aspectFill, options: options){ result, _ in
            if let image = result {
                DispatchQueue.main.async{
                    self.image = image
                }
            }
        }
    }
}

struct photoThumbnailView : View {
    let asset : PHAsset
    let size : CGFloat
    let isSelected: Bool
    
    @State private var image: UIImage?
    private let imageManager = PHCachingImageManager()
    var body: some View {
        ZStack(alignment: .topTrailing, content: {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            if isSelected{
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.blue)
                    .background(Circle().fill(Color.white))
                .padding(5)}
            
        })
        .onAppear{
            loadImage()
            
        }
    }
    func loadImage (){
        let options = PHImageRequestOptions()
        options.deliveryMode = .opportunistic
        options.isNetworkAccessAllowed = true
        options.resizeMode = .fast
        imageManager.requestImage(for: asset, targetSize: CGSize(width: size, height: size), contentMode: .aspectFill, options: options){ result, _ in
            if let image = result {
                DispatchQueue.main.async{
                    self.image = image
                }
            }
        }
    }
}

#Preview {
    fullScreenPhotoGalleryView(viewModel: createViewModel())
}
