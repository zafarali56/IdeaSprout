//
//  savedBoardSheet.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 26/04/2025.
//

import SwiftUI

struct savedBoardSheet: View {
    @Bindable private var viewModel : createViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: createViewModel) {
        self._viewModel = Bindable (wrappedValue: viewModel)
    }
    var body: some View {
        VStack(spacing: 0, content: {
            Text("Saved to board")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading, content: {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    })
                }).padding(.vertical)
            
            ScrollView(content: {
                Button(action: {viewModel.selectedBoard = "Nature"; dismiss()}, label: {
                    HStack(spacing: 12, content: {
                        Image("habibi")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text("Nature")
                            .font(.headline)
                            .foregroundStyle(.black)
                        Spacer()
                    })
                })
            })
            Button(action: {}, label: {
                HStack(spacing: 12, content: {
                    Circle().fill(Color(.systemGray6))
                        .frame(width:50, height: 50)
                        .overlay(content: {
                            Image(systemName: "plus")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(.red)
                        })
                    
                   Text("Create board")
                        .font(.headline)
                        .foregroundStyle(.black)
                    Spacer()
                })
                
              
            })
        }).padding()
    }
}

#Preview {
    savedBoardSheet(viewModel: createViewModel())
}
