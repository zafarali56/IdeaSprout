//
//  mainTabView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 15/03/2025.
//

import SwiftUI

struct mainTabView: View {
    @State private var viewModel = mainTabViewModel()
    var body: some View {
        TabView( selection : $viewModel.selectedTab){
            
            Tab("Home", systemImage: "house", value: 0) {
                
            }
            Tab("Search", systemImage:"magnifyingglass", value: 1)
            {
                
            }
            Tab("Create", systemImage: "plus", value: 2)
            {
                
            }
        
            Tab("Notfications", systemImage: "bell", value: 3)
            {
                
            }
            Tab("Saved", systemImage: "bookmark", value : 4)
            {
                
            }
            
            
        }.onChange(of: viewModel.selectedTab, {oldValue , newValue in
            if newValue == 2
            {
                viewModel.selectedTab = oldValue
                viewModel.showCreateMenu = true
            }})
        
        .sheet(isPresented: $viewModel.showCreateMenu)
        {
            Text("create menu")
                .presentationDetents([.height(250)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    mainTabView()
}
