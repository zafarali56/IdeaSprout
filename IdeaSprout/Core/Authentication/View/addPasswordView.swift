//
//  addPasswordView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 01/04/2025.
//

import SwiftUI

struct addPasswordView: View {
    @Bindable var  viewModel:loginViewModel
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    addPasswordView(viewModel: loginViewModel())
}
