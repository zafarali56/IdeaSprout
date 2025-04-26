//
//  tagTopicView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 26/04/2025.
//

import SwiftUI

struct tagTopicView: View {
    @Bindable private var viewModel: createViewModel
    @Environment(\.dismiss) private var dismiss
    
    init(viewModel: createViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                
                TextField("Title", text: $viewModel.searchText)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                if viewModel.selectedTopics.count > 0 {
                    Text("Selected")
                        .font(.headline)
                        .foregroundStyle(.green)
                }
                
                ScrollView {
                    LazyVGrid(columns: viewModel.topicGridItem, spacing: 8) {
                        ForEach(viewModel.displayTopics, id: \.self) { topic in
                            TopicButton(topic: topic, isSelected: viewModel.selectedTopics.contains(topic)) {
                                viewModel.toggleSelection(topic)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Tag topics")
                        .fontWeight(.semibold)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { dismiss() }) {
                        Text("Done")
                            .padding(8)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        tagTopicView(viewModel: createViewModel())
    }
}

// MARK: - Subview

private struct TopicButton: View {
    let topic: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(topic)
                .lineLimit(1)
                .truncationMode(.middle)
                .padding(8)
                .frame(maxWidth: .infinity)
                .background(isSelected ? Color.black : Color(.systemGray4))
                .foregroundStyle(isSelected ? .white : Color(.darkGray))
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
}
