//
//  createBoardView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 16/03/2025.
//

import SwiftUI

struct createBoardView: View {
    @Bindable private var viewModel : createViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: createViewModel) {
        self._viewModel = Bindable (wrappedValue: viewModel)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            ZStack {
                HStack{
                    Button{dismiss()}label:{
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .foregroundStyle(.red)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Next")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.darkGray))
                            .padding(.horizontal)
                            .padding(.vertical,8)
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    })
                    
                }
                Text("Create board")
                    .font(.headline)
                    
            }
            Text("Borad Name")
                .font(.footnote)
                .foregroundStyle(Color(.darkGray))
                .padding(.top)
            
            TextField("Add DIY or Recipe",  text: $viewModel.boardName)
            Text("Collaborators")
                .TitleModifier()
            
            HStack{
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 50, height: 50)
                    Spacer()
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 50, height: 50)
                    .overlay{
                        Image(systemName: "person.fill.badge.plus")
                    }
            }
            Text("Visbility")
                .TitleModifier()
            
            Toggle(isOn: $viewModel.isSecretBoard, label:{
                Text("Keep this board Secret")
                    .font(.headline)
                    .fontWeight(.semibold)
            })
            Text("If you don't want others to see the board keep it secret")
                .TitleModifier()
            .padding(.vertical, 12)
            Spacer()
            
        })
        .padding(.horizontal)
        
    }
}

#Preview {
    createBoardView(viewModel: createViewModel())
}
