//
//  inboxView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import SwiftUI

struct inboxView: View {
    @Bindable private var viewModel : notificationViewModel
    init(viewModel: notificationViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        VStack(alignment: .leading, content: {
            searchBarView(searchTerm: $viewModel.searchTerm, showImageIcon: false, title: "Search for ideas")
            inboxCell(title: "New message", imageName: "pencil.circle.fill")
            inboxCell(title: "Invite friends", imageName: "person.crop.circle.fill.badge.plus", subtitle: "Connect to start chatting")
            Spacer()
        }).padding()
        
    }
}

#Preview {
    inboxView(viewModel: notificationViewModel())
}

struct inboxCell: View {
    private var title: String
    private var imageName: String
    private var subtitle: String?
    init(title: String, imageName: String, subtitle: String? = nil) {
        self.title = title
        self.imageName = imageName
        self.subtitle = subtitle
    }
    var body: some View {
        HStack(content: {
            Rectangle()
                .fill(subtitle != nil ? Color(.systemGray6) : .red)
                .clipShape(RoundedRectangle(cornerRadius:15))
                .frame(width: 50,height: 50)
                .overlay(content: {
                    Image(systemName: imageName)
                        .foregroundStyle(subtitle != nil ? .black : .white)
                        .fontWeight(.bold)
                        .imageScale(.large)
                })
            VStack(alignment: .leading, content: {
                Text(title).fontWeight(.semibold)
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
        
            })
        
        })
       
    }
}
