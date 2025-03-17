//
//  pinCard.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import SwiftUI

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
                viewModel.pin[index].isSelected.toggle()
            }, label: {
                ZStack(alignment:.bottomTrailing, content: {
                    Image(viewModel.pin[index].imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .frame(width: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Image(systemName: viewModel.pin[index].isSelected ?"checkmark" : "pin.fill")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(viewModel.pin[index].isSelected ? .red : .black.opacity(0.3))
                        .clipShape(Circle())
                        .padding(9)
                })
            })
            Text(viewModel.pin[index].item_Name)
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
