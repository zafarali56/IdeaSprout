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
    var body: some View {
        VStack(content: {
            HStack(content: {
                Button(action:{}, label: {
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
            Spacer()
        })
        .padding()
    }
}

#Preview {
    signInView(viewModel: loginViewModel())
}
