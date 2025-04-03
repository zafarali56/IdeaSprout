//
//  addPasswordView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 01/04/2025.
//

import SwiftUI

struct addPasswordView: View {
    @Bindable var  viewModel:loginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader(content: { proxy in
            VStack(spacing: 20, content: {
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                HStack(content: {
                    Spacer()
                    customSecureField(width: proxy.size.width * 0.8, isSecureField: $viewModel.isSecureField, password: $viewModel.password)
                    Spacer()
                })
                
                Spacer()
                NavigationLink(destination: {
                    addNameView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                }, label: {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .background(viewModel.password.count < 6 ? Color(.systemGray) : Color(.red))
                        .foregroundStyle(viewModel.password.count < 6 ? .black : .white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.bottom)
                })
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading,content: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large).onTapGesture {
                            viewModel.password = ""
                            dismiss()
                        }
                })
                ToolbarItem(placement:.principal, content: {
                    indicatorView(numberOfScreen: 1)
                })
            })
        })
        
    }
}

#Preview {
    NavigationStack{
        
        
        addPasswordView(viewModel: loginViewModel())
    }
}

