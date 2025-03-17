//
//  notificationView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import SwiftUI

struct notificationView: View {
    @State private var viewModel = notificationViewModel()
    var body: some View {
        VStack(spacing: 30, content: {
            HStack(spacing: 30 ,content: {
                Button(action: {viewModel.tabSelection = .Update}, label: {
                    tabSelectionView(title: "Update", width: 70, viewModel: viewModel, tabSelection: .Update)
                })
                Button(action: {viewModel.tabSelection = .Inbox}, label: {
                    tabSelectionView(title: "Inbox", width: 30, viewModel: viewModel, tabSelection: .Inbox)
                })
                
            })
            
            switch viewModel.tabSelection{
            case .Update:
                updateView()
            case .Inbox:
                inboxView()
            }
            Spacer()
        })
        
    }
}

#Preview {
    notificationView()
}

struct tabSelectionView: View {
    private var title : String
    private var width : CGFloat
    @Bindable private var viewModel : notificationViewModel
    private var tabSelection : notificationTabSelection
    init(title: String, width: CGFloat, viewModel: notificationViewModel, tabSelection: notificationTabSelection) {
        self.title = title
        self.width = width
        self._viewModel = Bindable(wrappedValue: viewModel)
        self.tabSelection = tabSelection
    }
    var body: some View {
        VStack(spacing: 4,content: {
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(Color(.darkGray))
            Rectangle()
                .frame(width: width, height: 4)
                .foregroundStyle(viewModel.tabSelection == tabSelection ? Color(.red) : .clear)
        })
    }
}
