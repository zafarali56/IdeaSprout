//
//  homeView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 19/03/2025.
//

import SwiftUI

struct homeView: View {
    @State private var viewModel = homeViewModel()
   
    var body: some View {
  VStack(content: {
      VStack(spacing: 0, content: {
          Text("All")
              .font(.title2)
              .fontWeight(.semibold)
          Rectangle()
              .frame(width: 32, height: 2)
      })
      staggeredGridView(items: viewModel.items, columns: 2)
          .padding()
  })
    }
}

#Preview {
    homeView()
}
