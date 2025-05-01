//
//  mainTabView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 15/03/2025.
//

import SwiftUI

struct mainTabView: View {
	@State private var viewModel = mainTabViewModel()

	@State private var previousSelectedTab: Int = 0

	var body: some View {
		TabView(selection: $viewModel.selectedTab) {
			homeView()
				.tabItem { Label("Home", systemImage: "house") }
				.tag(0)
			searchView()
				.tabItem { Label("Search", systemImage: "sparkle.magnifyingglass") }
				.tag(1)

					Color.clear
				.tabItem { Label("Create", systemImage: "plus") }
				.tag(2)

			notificationView()
				.tabItem { Label("Notifications", systemImage: "bell") }
				.tag(3)

			savedView()
				.tabItem { Label("Saved", systemImage: "bookmark") }
				.tag(4)
		}
		.onChange(of: viewModel.selectedTab) { oldValue, newValue in
			if newValue == 2 {
				viewModel.selectedTab = previousSelectedTab
				viewModel.isFullScreen = false // Default to smaller sheet
				viewModel.showCreateMenu = true
			} else {
				previousSelectedTab = newValue
			}
		}
		.sheet(isPresented: $viewModel.showCreateMenu) {
			createView(isFullScreen: $viewModel.isFullScreen)
				.presentationDetents(viewModel.isFullScreen ? [.large] : [.height(250), .large]) // Allow large even from small
				.presentationDragIndicator(.visible)
		}
		 .onAppear {
			 previousSelectedTab = viewModel.selectedTab
		 }
	}
}

#Preview {
    mainTabView()
}
