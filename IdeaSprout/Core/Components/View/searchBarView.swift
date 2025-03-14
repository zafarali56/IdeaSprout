//
//  searchBarView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 14/03/2025.
//

import SwiftUI

struct searchBarView: View {
    @Binding var searchTerm : String
    var title : String
    var body: some View {
        ZStack(alignment: .trailing){
            TextField(title, text: $searchTerm)
            Image(systemName: searchTerm.isEmpty ? "camera.fill" : "xmark.circle.fill")
                .foregroundStyle(.gray)
                .onTapGesture {
                    searchTerm = ""
                }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 30).fill(Color(.systemGray6)))
        .padding()
    }
}

#Preview {
    searchBarView(searchTerm: .constant(""), title: "search for ideas")
}
