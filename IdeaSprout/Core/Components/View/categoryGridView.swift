//
//  categoryGridView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 12/03/2025.
//

import SwiftUI

struct categoryGridView: View {
    @Bindable var viewModel : searchViewModel
    private let gridItems : [GridItem] = [.init(.flexible(), spacing: 1), .init(.flexible(), spacing: 1)]
    private var imageDimension : CGFloat {
        return UIScreen.main.bounds.width / 2-16
    }
    var body: some View {
        LazyVGrid(columns: gridItems, spacing : 1)
        {
            ForEach(viewModel.items) {item in
                ZStack{
                    Image(item.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageDimension, height: 120)
                        .clipped()
                        .overlay {
                            Color.black.opacity(0.4)
                        }
                    
                    Text(item.item_Name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                }.clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(5)
            }
        }
    
        
    }
}

#Preview {
    categoryGridView(viewModel: searchViewModel())
}
