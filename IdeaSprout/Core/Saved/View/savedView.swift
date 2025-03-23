//
//  savedView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 21/03/2025.
//

import SwiftUI

struct savedView: View {
    @State private var viewModel = savedViewModel()
    var body: some View {
        
        GeometryReader { proxy in
            VStack(content: {
                HStack(spacing: 20,content: {
                    Circle().fill(Color(.systemGray5))
                        .frame(width: 30, height: 30)
                        .overlay(content:{
                            if let first = viewModel.userName.first{
                                Text(first.uppercased())
                            }
                        })
                    Spacer()
                    Button(action: {viewModel.tabSelection = .pin}, label: {
                        VStack(spacing: 4,content: {
                            Text("Pins")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.black))
                            Rectangle().frame(width: 60, height: 4)
                                .frame(width: 70, height: 4)
                                .foregroundStyle(viewModel.tabSelection == .pin ? Color(.red) : .clear)
                        })
                    })
                    
                    Button(action: {viewModel.tabSelection = .board}, label: {
                        VStack(spacing: 4,content: {
                            Text("Boards")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color(.black))
                            Rectangle().frame(width: 60, height: 4)
                                .frame(width: 70, height: 4)
                                .foregroundStyle(viewModel.tabSelection == .board ? Color(.red) : .clear)
                        })
                    })
                    
                    Spacer()
                    Circle().fill(Color(.systemGray5))
                        .frame(width: 30, height: 30)
                        .opacity(0.4)
                })
                .padding(.horizontal)
                
                HStack {
                    searchBarView(searchTerm: $viewModel.searchTerm, title: "Search your pins", alignment: .leading)
                        .frame(width: max(proxy.size.width - 50, 0))

                    Image(systemName: "plus")
                }.padding(.top,3)


                switch viewModel.tabSelection {
                case .pin:
                    staggeredGridView(items: viewModel.items, columns: 3)
                        .padding()
                case .board:
                boardView(viewModel: viewModel)
                }
                Spacer()
            })
        }
      
    }
}

#Preview {
    savedView()
}
