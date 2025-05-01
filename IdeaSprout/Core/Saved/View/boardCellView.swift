//
//  boardCellView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 22/03/2025.
//

import SwiftUI
import Kingfisher

struct boardCellView: View {
	@Bindable private var viewModel : savedViewModel
	private var index : Int
	init(viewModel: savedViewModel, index: Int) {
		self._viewModel = Bindable(wrappedValue:viewModel)
		self.index = index
	}
    var body: some View {
        VStack(alignment: .leading,content: {
            HStack(spacing:2,content: {
                Color.gray.opacity(0.2)
                    .frame(width: 100, height: 162)
                    .clipShape(customCorner(radius: 16, corner: [.topLeft, .bottomLeft]))
					.overlay(content: {
						if viewModel.boardWithPins[index].1.count > 0 {
							KFImage(URL(string: viewModel.boardWithPins[index].1[0].imageName))
								.resizable()
								.frame(width: 100, height: 162)
								.clipShape(customCorner(radius: 16, corner: [.topLeft, .bottomLeft]))
						}
					})
                VStack(spacing:2 , content: {
                    Color.gray.opacity(0.2)
                        .frame(height: 80)
                        .clipShape(customCorner(radius: 16, corner: [.topRight]))
						.overlay(content: {
							if viewModel.boardWithPins[index].1.count > 1 {
								KFImage(URL(string: viewModel.boardWithPins[index].1[1].imageName))
									.resizable()
									.frame(width: 100, height: 162)
									.clipShape(customCorner(radius: 16, corner: [.topLeft, .bottomLeft]))
							}
						})
                    Color.gray.opacity(0.2)
                        .frame(height: 80)
                        .clipShape(customCorner(radius: 16, corner: [.bottomRight]))
						.overlay(content: {
							if viewModel.boardWithPins[index].1.count > 1 {
								KFImage(URL(string: viewModel.boardWithPins[index].1[1].imageName))
									.resizable()
									.frame(width: 100, height: 162)
									.clipShape(customCorner(radius: 16, corner: [.topLeft, .bottomLeft]))
							}
						})
                }).frame(width: 80)
            })
			Text("\(viewModel.boardWithPins[index].0.boardName)")
                .font(.headline)
            HStack(content: {
				Text("\(viewModel.boardWithPins[index].1.count)")
                    .font(.footnote)
                
                Text("5D")
                    .font(.caption)
                
            })
            .foregroundStyle(.gray)
        })
    }
}

#Preview {
	boardCellView(viewModel: savedViewModel(), index: 0)
}
