//
//  InterestView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 07/04/2025.
//

import SwiftUI

struct interestView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var viewModel: loginViewModel

    var body: some View {

        GeometryReader { proxy in
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        Text("What are you interested in?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.top)
                        
                        Text("Pick 5 to customize your home feed")
                            .foregroundStyle(.secondary)
                        
                        LazyVGrid(columns: viewModel.gridItems, spacing: 1,content:{
                            ForEach(viewModel.interest) {interest in
                                VStack(content: {
                                    ZStack (alignment: .topTrailing){
                                        Image(interest.imageName)
                                            .resizable()
                                            .frame(width: proxy.size.width / 4 , height: proxy.size.width / 4)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                        
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 25, height: 25)
                                            .overlay(content: {
                                                Image(systemName:"checkmark")
                                                    .foregroundStyle(.white)
                                                
                                            })
                                            .padding(8)
                                            .opacity(interest.isSelected ? 1 : 0)
                                    }
                                    .onTapGesture {
                                        if let index = viewModel.interest.firstIndex(where: { $0 == interest }) {
                                            viewModel.interest[index].isSelected.toggle()
                                            if viewModel.interest[index].isSelected == true{
                                                viewModel.isSelectedInterests.append(interest)
                                            } else {
                                                viewModel.isSelectedInterests.remove(at: index)
                                            }
                                                
                                        }
                                    }

                                    Text(interest.itemName).font(.subheadline).fontWeight(.semibold)
                                        .padding(.vertical,4)
                                })
                            }
                        } )
                        
                        
                    }
                }
                .scrollIndicators(.hidden)
                Button(action: {
                    Task{
                        try await viewModel.createUser()
                    }
                }, label: {
                    Text("Next")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(viewModel.isSelectedInterests.count >= 5 ? Color.red : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                })
                .padding()
               
           
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.isSelectedInterests = []
                            dismiss()
                        }
                }
                ToolbarItem(placement: .principal) {
                    indicatorView(numberOfScreen: 5)
                }
            }


        }
        
    }
}



#Preview {
    NavigationStack{
        interestView(viewModel: loginViewModel())
    }
}
