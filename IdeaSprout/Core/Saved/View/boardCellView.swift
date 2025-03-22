//
//  boardCellView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 22/03/2025.
//

import SwiftUI

struct boardCellView: View {
    var body: some View {
        VStack(alignment: .leading,content: {
            HStack(spacing:2,content: {
                Color.gray.opacity(0.2)
                    .frame(width: 100, height: 162)
                    .clipShape(customCorner(radius: 16, corner: [.topLeft, .bottomLeft]))
                VStack(spacing:2 , content: {
                    Color.gray.opacity(0.2)
                        .frame(height: 80)
                        .clipShape(customCorner(radius: 16, corner: [.topRight]))
                    Color.gray.opacity(0.2)
                        .frame(height: 80)
                        .clipShape(customCorner(radius: 16, corner: [.bottomRight]))
                }).frame(width: 80)
            })
            Text("Test5")
                .font(.headline)
            HStack(content: {
                Text("3 pin")
                    .font(.footnote)
                
                Text("5D")
                    .font(.caption)
                
            })
            .foregroundStyle(.gray)
    })
    }
}

#Preview {
    boardCellView()
}
