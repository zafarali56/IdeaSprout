//
//  rootView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/04/2025.
//

import SwiftUI

struct rootView: View {
	@State private var viewModel = RootViewModel()
	
    var body: some View {
		Group(content: {
			if viewModel.userSession != nil {
				mainTabView()
			} else{
				loginView()
			}
		})
    }
}

#Preview {
    rootView()
}
