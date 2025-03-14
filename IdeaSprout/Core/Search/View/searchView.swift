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
                
                Text("Popular on Sproutia")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .fontDesign(.rounded)
                
                categoryGridView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    searchView()
}
