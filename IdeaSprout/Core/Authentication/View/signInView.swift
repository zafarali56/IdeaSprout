//
//  signInView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 30/03/2025.
//

import SwiftUI

struct signInView: View {
    @Bindable private var viewModel: loginViewModel
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { proxy in
            VStack(content: {
                HStack(content: {
                    Button(action:{dismiss()}, label: {
                        Image(systemName: "xmark")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    })
                    Spacer()
                    Text("Log in")
                        .font(.headline)
                    Spacer()
                })
                Divider()
                    .padding()
                
                Button(action: {}, label: {
                    loginButton(color: .blue, width:  proxy.size.width * 0.7, title: "Continue with Facebook", imageName: "facebook", foregroundColor: .white)
                })
                Button(action: {viewModel.showSingInView.toggle()}, label: {
                    loginButton(color: .gray.opacity(0.5), width:  proxy.size.width * 0.7, title: "Continue with Google", imageName: "google", foregroundColor: .black)
                })
                Text("Or ")
                    .padding(.vertical)
                TextField("Email", text: $viewModel.email)
                    .EmailModifier()
                    .frame(width: proxy.size.width * 0.7)
                    .padding(.bottom,2)
                customSecureField(width: proxy.size.width * 0.7, isSecureField: $viewModel.isSecureField, password: $viewModel.password)
                loginButton(color: .red, width: proxy.size.width * 0.7, title: "Log in", imageName: "", foregroundColor: .white)
                    .padding(.top,30)
                
                Text("Forgotten password?")
                    .padding(.top)
                Spacer()
            })
            .padding()
        }
    }
}

#Preview {
    signInView(viewModel: loginViewModel())
}

