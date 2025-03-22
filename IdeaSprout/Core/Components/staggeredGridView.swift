//
//  staggeredGridView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 19/03/2025.
//

import SwiftUI

struct staggeredGridView: View {
    private var items: [Item]
    private var columns : Int
    init(items: [Item], columns: Int) {
        self.items = items
        self.columns = columns
    }
    func setupList()->[[Item]]{
        var gridArray : [[Item]] = Array(repeating: [], count: columns)
        
        var currentIndex : Int = 0
        for item in items {
            gridArray[currentIndex].append(item)
            if currentIndex == columns - 1 {
                currentIndex = 0
            } else {
                currentIndex += 1
            }
        }
        return gridArray
    
    }
    var body: some View {
        ScrollView(.vertical, content: {
            HStack(alignment: .top, spacing: 5, content: {
                ForEach(setupList(), id: \.self, content: {columnData in
                    LazyVStack(spacing: 5, content: {
                        ForEach((columnData), content: {item in
                            VStack(alignment: .trailing, content: {
                                Image(item.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxWidth: .infinity)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                Image(systemName: "ellipsis")
                                
                                    .imageScale(.large)
                                    .padding(.vertical,2)
                                
                            })
                        })
                    })
                })
            })
        }).scrollIndicators(.hidden)
        
    }
}

#Preview {
    var items : [Item] = [
        .init(id: UUID().uuidString, item_Name: "cat meme", isSelected: false, imageName: "post1"),
        .init(id: UUID().uuidString, item_Name: "spongbob", isSelected: false, imageName: "post2"),
        .init(id: UUID().uuidString, item_Name: "chad", isSelected: false, imageName: "post3"),
        .init(id: UUID().uuidString, item_Name: "sad wojak", isSelected: false, imageName: "post4"),
        .init(id: UUID().uuidString, item_Name: "steve rogers", isSelected: false, imageName: "post5"),
        .init(id: UUID().uuidString, item_Name: "avenger", isSelected: false, imageName: "post6"),
        .init(id: UUID().uuidString, item_Name: "thanos", isSelected: false, imageName: "post7"),
        .init(id: UUID().uuidString, item_Name: "obi wan", isSelected: false, imageName: "post8"),
        .init(id: UUID().uuidString, item_Name: "avenger endgame", isSelected: false, imageName: "post9"),
        
    ]
    staggeredGridView(items: items, columns: 2)
}
