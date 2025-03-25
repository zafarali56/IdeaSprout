//
//  accountView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 24/03/2025.
//

import SwiftUI

struct accountView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView(content: {
            VStack(alignment: .leading, spacing: 20,content: {
                profileView()
                Text("Settings")
                    .font(.subheadline)
            })
            .padding(.horizontal)
        })
        .toolbar{
            ToolbarItem(placement: .topBarLeading,content: {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .fontWeight(.bold)
                        .foregroundStyle(Color(.darkGray))
                })
            })
            ToolbarItem(placement: .principal, content: {
                Text("My account")
            })
        }
        
    }
}

#Preview {
    NavigationStack{
        accountView()
    }
}

struct profileView: View {
    var body: some View {
        HStack(content: {
            Circle()
                .fill(Color(.systemGray5))
                .frame(width: 50, height: 50)
                .overlay(content: {
                    Text("Z")
                        .font(.headline)
                        .fontWeight(.semibold)
                })
            VStack(alignment:.leading,content: {
                Text("Zafar ali")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("View profile")
                    .font(.subheadline)
            })
            Spacer()
        })
    }
}
