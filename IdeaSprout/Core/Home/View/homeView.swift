//
//  homeView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 19/03/2025.
//

import SwiftUI

struct homeView: View {
    @State private var viewModel = homeViewModel()
    
    var body: some View {
        VStack {

            staggeredGridView(items: viewModel.items, columns: 2) { item in
                if let index = viewModel.items.firstIndex(where: { $0.id == item.id }) {
                    NavigationLink(destination: detailView(viewModel: viewModel, index: index)
                                    .navigationBarBackButtonHidden(true)) {
                        itemCard(item: item)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        homeView()
    }
}
