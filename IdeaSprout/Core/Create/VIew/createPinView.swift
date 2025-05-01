//
//  createPinView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 26/04/2025.
//

import SwiftUI
import Photos

struct createPinView: View {
	@Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel : createViewModel
	private var selectedAsset : Array<PHAsset> = []
	init(viewModel: createViewModel, selectedAsset: Array<PHAsset> = []) {
        self._viewModel = Bindable(wrappedValue: viewModel)
		self.selectedAsset = selectedAsset
    }
	
	private func loadSelecteImages (){
		let options = PHImageRequestOptions()
		options.deliveryMode = .highQualityFormat
		options.isNetworkAccessAllowed = true
		options.isSynchronous = false
		for assest in selectedAsset{
			PHImageManager.default().requestImage(for: assest, targetSize: PHImageManagerMaximumSize, contentMode: .aspectFit, options: options, resultHandler: { images, _ in
				if let image = images {
					DispatchQueue.main.async {
						viewModel.selectedImages.append(image)
					}
				}
			})
		}
	}
    var body: some View {
        NavigationStack {
            ScrollView(content: {
                VStack(content: {
					if let firstImage = viewModel.selectedImages.first{
						Image(uiImage: firstImage)
							.resizable().aspectRatio(contentMode: .fill).frame(width: 130, height: 180 )
							.clipShape(RoundedRectangle(cornerRadius: 15))
							.overlay(alignment:.topTrailing, content: {
								Circle().fill(.black).frame(width:30, height:30)
									.padding()
									.overlay(content: {
										Image(systemName: "pencil")
											.imageScale(.large)
											.foregroundStyle(.white)
									})
							}).padding()
					}

                    pinItemView(text: $viewModel.title, title: "Title", description: "Tell everyone what your pin is about", color: Color(.darkGray))
                                pinItemView(text: $viewModel.description, title: "Description", description: "Add description, mention or Hash tag", color: .gray)
                                pinItemView(text: $viewModel.link, title: "Link", description: "Add your link here", color: .gray)
                    Button(action: {viewModel.boardSheetPresented = true}, label: {
                        horizontalPinItemView(title: "Pick a board", value: viewModel.selectedBoard)
                    })
                   
                        .padding(.vertical)
                    Button(action: {viewModel.showTagTopics = true}, label: {
                        horizontalPinItemView(title: "Tag topics", value: viewModel.selectedTopics.count > 0 ? "\(viewModel.selectedTopics.count)" : "")
                    })
                   
                    HStack(content: {
                        Circle()
                            .fill(Color(.systemGray5))
                            .frame(width: 45, height: 45)
                            .overlay(content: {
                            Image(systemName: "folder.fill")
                            })
                        Spacer()
                        
                        Button(action: {
							Task{
								try await viewModel.uploadPin()
								dismiss()
							}
							
						}, label: {
                            Text("Create")
                                .padding(10)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .background(.red)
                                .foregroundStyle(.white)
                             
                                .clipShape(RoundedRectangle(cornerRadius: 40))

                        })
                    })

                    
                })
                .padding(.horizontal, 10)
                
            })
			.onAppear{
				self.loadSelecteImages()
			}
            .fullScreenCover(isPresented: $viewModel.showTagTopics, content: {
                tagTopicView(viewModel: viewModel)
          
            })
            .sheet(isPresented: $viewModel.boardSheetPresented, content: {
                savedBoardSheet(viewModel: viewModel)
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.medium])
                
            })
	
            .scrollIndicators(.hidden)
                .navigationTitle("Create Pin")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading, content: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    })
                }
        }
    }
}

#Preview {
    NavigationStack{
        createPinView(viewModel: createViewModel())
    }
}

struct pinItemView: View {
    @Binding var text: String
    var title: String
    var description: String
    var color: Color
    var body: some View {
        VStack(spacing:20) {
            VStack(alignment:.leading, content: {
                Text("\(title)")
                    .font(.subheadline)
                    .foregroundStyle(Color(.darkGray))
                
                TextField(text: $text, label: {
                    Text("\(description)")
                        .font(.headline)
                        .fontWeight(color == .gray ? .regular : .semibold)
                        .foregroundStyle(color)
                })
            }).padding(.horizontal)
            Divider()
        }
    }
}

struct horizontalPinItemView: View {
    var title : String
    var value : String
    
    var body: some View {
        VStack(spacing: 20, content: {
            HStack(content: {
                Text(title)
                    .font(.subheadline)
                Spacer()
                Text(value)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.darkGray))
                Image(systemName: "chevron.right").imageScale(.large)
                    .bold()
            })
            .padding(.horizontal)
            Divider()
        })
    }
}
