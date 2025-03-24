//
//  detailView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 23/03/2025.
//

import SwiftUI

struct detailView: View {
    @Bindable private var viewModel : homeViewModel
    private var index : Int
    @Environment(\.dismiss) private var dismiss
    init(viewModel: homeViewModel, index: Int) {
        self._viewModel = Bindable(viewModel)
        self.index = index
    }
    var body: some View {
        
        ScrollView(content: {
            VStack(alignment: .leading ,spacing: 25,content: {
                ZStack(alignment:.leading, content: {
                    ZStack(alignment: .bottomTrailing, content: {
                        Image(viewModel.items[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(content: {
                            detailedCircleView(image: "magnifyingglass", dimesions: 40)
                            detailedCircleView(image: "scissors", dimesions: 40)
                            
                        })
                        .padding()
                    })
                    Button(action: {dismiss()}, label: {
                        detailedCircleView(image: "chevron.backward", dimesions: 50)
                        
                    })
                    .padding()
                })
                HStack(spacing: 25,content: {
                    Image(systemName: "heart")
                    Image(systemName: "bubble")
                    Image(systemName: "square.and.arrow.up")
                    Image(systemName: "ellipsis")
                    Spacer()
                    Button(action: {}, label: {
                        Text("Save")
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            .foregroundStyle(Color(.white))
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    })
                   
                })
                HStack(content: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 20,height: 20)
                    Text("zafar ali")
                        .font(.headline)
                })
                Text("1 comment")
                HStack(content: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Text("Yes, should be...")
                        .font(.subheadline)
                    
                    
                    Button(action: {}, label: {
                        Text("View")
                            .font(.subheadline)
                    })
                })
                Button(action: {}, label: {
                    ZStack( content: {
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color(.systemGray),lineWidth: 1)
                           
                        HStack(content: {
                            Text("Add a comment")
                            .foregroundStyle(Color(.systemGray2))
                            Spacer()
                            
                        }).padding(10)
                            
                    })
                })
                
                Divider()
                Text("More to explore")
                    .font(.headline)
                    .foregroundStyle(Color(.darkGray))
                staggeredGridView(items: viewModel.items, columns: 2)
            }).padding(.horizontal)
                .padding(.top)
        })
     
    }
}

#Preview {
    detailView(viewModel: homeViewModel(), index: 0)
}

struct detailedCircleView: View {
    var image : String
    var dimesions: CGFloat
    var body: some View {
        Circle().frame(width: 40, height: dimesions)
            .foregroundStyle(Color(.systemGray5))
            .overlay(content: {
                Image(systemName:   image)
                    .imageScale(dimesions>40 ? .large : .medium)
                    .fontWeight(dimesions>40 ? .bold : .regular)
                    .foregroundStyle(Color(.darkGray))
            })
    }
}
