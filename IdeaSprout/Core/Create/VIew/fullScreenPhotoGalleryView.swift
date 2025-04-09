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
        self._viewModel = Bindable(wrappedValue:viewModel)
    }
    var body: some View {
        GeometryReader{ proxy in
            VStack(spacing:0, content: {
                ZStack {
                    HStack(content: {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .foregroundStyle(.black)
                        })
                        Spacer()
                        Button("next", action: {})
                            .foregroundStyle(.red)
                            .fontWeight(.semibold)
                    })
                    
                    
                    Text("All photos")
                        .font(.headline)
                }.padding(.horizontal)
                    .padding(.vertical)
                HStack(spacing: 30, content: {
                    ForEach (viewModel.tabs, id: \.self){tab in
                        VStack(spacing: 8, content: {
                            Text(tab)
                                .foregroundStyle(viewModel.isSelectedTab == tab ? .black : .gray)
                            Rectangle()
                                .fill(viewModel.isSelectedTab == tab ? .black : .clear)
                                .frame(height: 2)
                            
                        }).onTapGesture {
                            viewModel.isSelectedTab = tab
                        }
                    }
                })
                ScrollView(content: {
                    LazyVGrid(columns: viewModel.gridItems,spacing: 1, content: {
                        ForEach(viewModel.photoAssests , id: \.localIdentifier){assets in
                            photoThumbnailView(asset: assets, size: proxy.size.width / 3)
                        }
                    })
                }).onAppear {
                    viewModel.photoPermission()
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal)
                Spacer()
            })
        }
    }
}

struct photoThumbnailView : View {
    let asset : PHAsset
    let size : CGFloat
    @State private var image: UIImage?
    private let imageManager = PHCachingImageManager()
    var body: some View {
        ZStack( content: {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .clipped()
            }
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
