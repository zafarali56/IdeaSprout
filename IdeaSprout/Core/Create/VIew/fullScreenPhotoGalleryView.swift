//
//  fullScreenPhotoGalleryView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 08/04/2025.
//

import SwiftUI

struct fullScreenPhotoGalleryView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel: createViewModel
    init(viewModel: createViewModel) {
        self._viewModel = Bindable(wrappedValue:viewModel)
    }
    var body: some View {
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
                        
                    }
                })
            }).scrollIndicators(.hidden)
            .padding(.horizontal)
            

            
            Spacer()
        })
    }
}

#Preview {
    fullScreenPhotoGalleryView(viewModel: createViewModel())
}
