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
            
            VStack{
                searchBarView(
                    searchTerm: $viewModel.searchTerm,
                    title: viewModel
                        .title)
                Text("Popular on Sproutia")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                
                categoryGridView(viewModel: viewModel)
                Spacer()
            }
        }
    }
}

#Preview {
    searchView()
}
