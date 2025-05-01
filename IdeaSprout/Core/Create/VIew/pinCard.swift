//
//  pinCard.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import SwiftUI
import Kingfisher
struct pinCard: View {
    private var index: Int
    @Bindable private var viewModel: createViewModel
    init(index: Int, viewModel: createViewModel) {
        self.index = index
        self._viewModel = Bindable (wrappedValue: viewModel)
    }
    var body: some View {
        VStack(alignment: .leading,spacing: 5, content: {
            Button(action: {
                viewModel.pins[index].isSelected.toggle()
            }, label: {
                ZStack(alignment:.bottomTrailing, content: {
           
					KFImage(URL(string: viewModel.pins[index].imageName))
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .frame(width: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image(systemName: viewModel.pins[index].isSelected ?"checkmark" : "pin.fill")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(viewModel.pins[index].isSelected ? .red : .black.opacity(0.3))
                        .clipShape(Circle())
                        .padding(9)
                })
            })
            Text(viewModel.pins[index].item_Name)
                .foregroundStyle(.black)
                .font(.subheadline)
                .lineLimit(2,reservesSpace: true)
                .padding(.horizontal)
            
           
        })
    }
}

#Preview {
    pinCard(index: 0, viewModel: createViewModel())
}
