//
//  addAgeView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 04/04/2025.
//

import SwiftUI

struct addAgeView: View {
    @Bindable private var viewModel : loginViewModel
    @Environment(\.dismiss) private var dismiss
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue:viewModel)
    }
    var body: some View {
        
        GeometryReader { proxy in
            ZStack {
                
                VStack(spacing:20, content: {
                    Text("Hi \(viewModel.fullName) Enter your date of birth")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top)
                    
                    Text("To help keep pinterest safe, we now require your date of birth. your date of birth will help us provide more personalized reccomendations and relevent ads, we won't share this information without your permission and won't be visible on your profile")
                        .frame(width: proxy.size.width * 0.9)
                    Button(action: {viewModel.isPresented = true}, label: {
                        Text("8 july 2025")
                            .foregroundStyle(.red)
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                    })
                    Text("Use your own age even if this is business")
                        .foregroundStyle(.gray)
                        .font(.subheadline)
                    Spacer()
                    NavigationLink(destination: {}, label: {
                        Text("Next")
                            .frame(width: proxy.size.width * 0.9, height: 60)
                            .foregroundStyle(viewModel.birthDate.count < 3 ? .black : .white)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .background(viewModel.birthDate.count < 3 ? Color(.systemGray5) : .red)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }).padding(.bottom)
                    
                }).padding()
                .toolbar{
                    ToolbarItem(placement: .topBarLeading, content: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                viewModel.birthDate = ""
                                dismiss()
                            }
                        
                    })
                    ToolbarItem(placement:.principal, content: {
                        indicatorView(numberOfScreen: 3)
                    })
                    
                    
                }
                HStack(content: {
                    if viewModel.isPresented {
                        Color.black.opacity(0.4)
                            .onTapGesture {
                                viewModel.isPresented = false
                            }
                    }
                }).ignoresSafeArea()
               
            }
        }
    }
}

#Preview {NavigationStack{
    addAgeView(viewModel: loginViewModel())
}
}
