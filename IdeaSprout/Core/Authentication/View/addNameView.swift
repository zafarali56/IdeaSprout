//
//  addNameView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 03/04/2025.
//

import SwiftUI

struct addNameView: View {
    @Bindable private var viewModel: loginViewModel
    @Environment(\.dismiss) private var dissmiss
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(content: {
                Text("What's your name?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                HStack(content: {
                    Spacer()
                    TextField("Full name", text: $viewModel.fullName)
                        .EmailModifier()
                        .frame(width: proxy.size.width * 0.8)
                Spacer()
                })
                
                Spacer()
                
                NavigationLink(destination: {}, label: {
                    Text("Next")
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .foregroundStyle(viewModel.fullName.count < 3 ? .black : .white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .background(viewModel.fullName.count < 3 ? Color(.systemGray5) : .red)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
 
                     
                    
                })
                
            }).toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.fullName = ""
                            dissmiss()
                        }
                    
                })
                ToolbarItem(placement:.principal, content: {
                    indicatorView(numberOfScreen: 2)
                })
                
                
            }
        }
    }
}

#Preview {
    NavigationStack{
    addNameView(viewModel: loginViewModel())
}
}
