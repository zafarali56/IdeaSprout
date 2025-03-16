//
//  createView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 16/03/2025.
//

import SwiftUI

struct createView: View {
    @State private var viewModel = createViewModel()
    @Environment(\.dismiss) private var dismiss
    @Binding var isFullScreen : Bool
    var body: some View {
        if viewModel.showCreateBoard{
        createBoardView(viewModel: viewModel)
        }
        else {
            VStack {
                NavigationStack{
                    VStack(spacing: 25){
                        Text("Start Creating")
                            .font(.title3)
                            .fontWeight(.semibold)
                        HStack(spacing: 50)
                        {
                            createOptionView(title: "Pin", icon: "pin.fill")
                            createOptionView(title: "College", icon: "scissors")
                            Button {
                                viewModel.showCreateBoard = true
                                isFullScreen = true
                            }label: {
                                createOptionView(title: "Board", icon: "square.grid.2x2.fill")
                            }
                            
                        }
                       Spacer()
                    }
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading, content: {
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "xmark")
                                    .foregroundStyle(.red)
                            }
                        })
                    }
                }
            }
        }
    }
}
#Preview {
    createView(isFullScreen: .constant(false))
}

struct createOptionView: View {
    private var title: String
    private var icon: String
    init(title: String, icon: String) {
        self.title = title
        self.icon = icon
    }
    var body: some View {
        VStack(spacing: 8)
        {
            Circle()
                .fill(Color(.systemGray6))
                .frame(width: 60, height: 60)
                .overlay{
                    Image(systemName: icon)
                        .font(.system(size: 24))
                }
            Text(title)
                .font(.caption)
            
        }.foregroundStyle(.red)
    }
}
