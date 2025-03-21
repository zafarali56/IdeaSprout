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
               homeView()
            }
            Tab("Search", systemImage:"sparkle.magnifyingglass", value: 1){
               searchView()
            }
            Tab("Create", systemImage: "plus", value: 2){
                
            }
            Tab("Notfications", systemImage: "bell", value: 3){
               notificationView()
            }
            Tab("Saved", systemImage: "bookmark", value : 4){
                savedView()
            }
        }.onChange(of: viewModel.selectedTab, {oldValue , newValue in
            if newValue == 2{
                viewModel.selectedTab = oldValue
                viewModel.showCreateMenu = true
                viewModel.isFullScreen = false
            }})
        .sheet(isPresented: $viewModel.showCreateMenu){
            createView(isFullScreen: $viewModel.isFullScreen)
                .presentationDetents(viewModel.isFullScreen ? [.large] : [.height(250)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    mainTabView()
}
