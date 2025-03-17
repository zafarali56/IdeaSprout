//
//  addPinView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import SwiftUI

struct addPinView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel : createViewModel
    init(viewModel: createViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationStack{
            ScrollView(content: {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(),spacing: 16)],spacing: 16)
                {
                    ForEach(0 ..< viewModel.pin.count, id: \.self){ index in
                       pinCard(index: index, viewModel: viewModel)
                    }
                }
            }
            )
            .padding(.top)
            .padding(.horizontal)
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    HStack{
                        Button{
                            dismiss()
                        }label: {
                            Image(systemName: "xmark")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(.red)
                        }
                        Text("Add pin")
                    }
                  
                })
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing, content: {
                    HStack{
                        Button {
                        }label: {
                                Text("Done")
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(.red)
                                .clipShape(RoundedRectangle(cornerRadius: 15))

                        }
                    }
                })
            }
        }
    }
}

#Preview {
    addPinView(viewModel: createViewModel())
}
