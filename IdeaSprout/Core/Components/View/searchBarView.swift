//
//  searchBarView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 14/03/2025.
//

import SwiftUI

struct searchBarView: View {
    @Binding var searchTerm : String
    var showImageIcon : Bool = false
    var title : String
    var alignment: Alignment = .trailing
    var body: some View {
        ZStack(alignment: alignment){
            TextField(title, text: $searchTerm)
                .padding(.leading, alignment == .leading ? 30 : 0)
            Image(systemName: searchTerm.isEmpty ? "camera.fill" : "xmark.circle.fill")
                .foregroundStyle(.gray)
                .opacity(showImageIcon ? 1:0)
                .onTapGesture {
                    searchTerm = ""
                }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 30).fill(Color(.systemGray6)))
    }
}

#Preview {
    searchBarView(searchTerm: .constant(""), title: "search for ideas")
}
