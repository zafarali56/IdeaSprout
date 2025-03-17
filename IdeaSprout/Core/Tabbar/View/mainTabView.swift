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
            
            Tab("Home", systemImage: "house.circle.fill", value: 0) {
                
            }
            Tab("Search", systemImage:"magnifyingglass.circle.fill", value: 1)
            {
                
            }
            Tab("Create", systemImage: "plus.square.fill", value: 2)
            {
                
            }
        
            Tab("Notfications", systemImage: "bell.circle.fill", value: 3)
            {
               notificationView()
            }
            Tab("Saved", systemImage: "bookmark.circle.fill", value : 4)
            {
                
            }
            
            
        }.onChange(of: viewModel.selectedTab, {oldValue , newValue in
            if newValue == 2
            {
                viewModel.selectedTab = oldValue
                viewModel.showCreateMenu = true
                viewModel.isFullScreen = false
            }})
        
        .sheet(isPresented: $viewModel.showCreateMenu)
        {
            createView(isFullScreen: $viewModel.isFullScreen)
                .presentationDetents(viewModel.isFullScreen ? [.large] : [.height(250)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    mainTabView()
}
