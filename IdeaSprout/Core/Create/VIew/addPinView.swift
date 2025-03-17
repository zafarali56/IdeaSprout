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
            }
            )
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
                    }
                    Text("Add pin")
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
                                .padding(.vertical, 15)
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
