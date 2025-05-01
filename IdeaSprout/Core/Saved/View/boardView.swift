//
//  boardView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 22/03/2025.
//

import SwiftUI

struct boardView: View {
    @Bindable private var viewModel : savedViewModel
    init(viewModel: savedViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
    VStack(spacing: 15,content: {
        boardOptionView()
        ScrollView(content: {
            LazyVGrid(columns:[GridItem(.flexible()),GridItem(.flexible())],spacing: 16, content: {
				ForEach(0 ..< viewModel.boardWithPins.count, id: \.self, content:{ index in
					boardCellView(viewModel: viewModel, index: index)
                        .padding()
                })
            })
        }).scrollIndicators(.hidden)
      
    })
    }
}

#Preview {
    boardView(viewModel: savedViewModel())
}

struct boardOptionView: View {
    var body: some View {
        HStack(content: {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .frame(width: 55, height: 30)
                .overlay(content: {
                    HStack(spacing: 0, content: {
                        Image(systemName: "arrow.up.arrow.down")
                            .imageScale(.small)
                        Image(systemName: "chevron.down")
                            .imageScale(.small)
                    })
                    .fontWeight(.bold)
                })
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .frame(width: 55, height: 30)
                .overlay(content: {
                    Text("Group")
                        .font(.footnote)
                })
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: 1)
                .frame(width: 55, height: 30)
                .overlay(content: {
                    Text("Secret")
                        .font(.footnote)
                })
            Spacer()
            
        })
        .padding(.top)
        .padding(.horizontal)
    }
}
