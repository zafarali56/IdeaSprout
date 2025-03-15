//
//  searchView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 12/03/2025.
//

import SwiftUI

struct searchView: View {
    @State private var viewModel = searchViewModel()
    var body: some View {
        NavigationStack{
            ScrollView{
                searchBarView(
                    searchTerm: $viewModel.searchTerm,
                    title: viewModel
                        .title)
                if viewModel.searchTerm.isEmpty{
                    Text("Popular memes")
                        .font(.title)
                        .fontWeight(.semibold)
                        .fontDesign(.rounded)
                    categoryGridView(viewModel: viewModel)
                }
                else {
                    categoryGridView(viewModel: viewModel)
                }
                Spacer()
            }
        }
        .padding(5)
    }
}

#Preview {
    searchView()
}
