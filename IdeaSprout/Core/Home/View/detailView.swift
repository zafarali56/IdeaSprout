//
//  detailView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 23/03/2025.
//

import SwiftUI

struct detailView: View {
    @Bindable private var viewModel : homeViewModel
    private var index : Int
    init(viewModel: homeViewModel, index: Int) {
        self._viewModel = Bindable(viewModel)
        self.index = index
    }
    var body: some View {
        
        ScrollView(content: {
            VStack(alignment: .leading ,spacing: 25,content: {
                ZStack(alignment:.leading, content: {
                    ZStack(alignment: .bottomTrailing, content: {
                        Image(viewModel.items[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(content: {
                            detailedCircleView(image: "magnifyingglass", dimesions: 40)
                            detailedCircleView(image: "scissors", dimesions: 40)
                    
                        })
                        .padding()
                    })
                })
            }).padding(.horizontal)
                .padding(.top)
        })
     
    }
}

#Preview {
    detailView(viewModel: homeViewModel(), index: 0)
}

struct detailedCircleView: View {
    var image : String
    var dimesions: CGFloat
    var body: some View {
        Circle().frame(width: 40, height: dimesions)
            .foregroundStyle(Color(.systemGray5))
            .overlay(content: {
                Image(systemName:   image)
                
            })
    }
}
