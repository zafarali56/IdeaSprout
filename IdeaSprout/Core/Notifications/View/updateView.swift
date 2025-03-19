//
//  updateView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 17/03/2025.
//

import SwiftUI

struct updateView: View {
    var body: some View {
            VStack(spacing: 20,content: {
                Spacer()
                Image("bell")
                Text("Nothing to see here yet")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text("Try exploring home and feed, creating a board or folowing somone, with ideas that inspire you.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                Spacer()
            }).padding(.horizontal, 20)
        }
}

#Preview {
    updateView()
}
