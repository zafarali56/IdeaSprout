//
//  addCountryView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 05/04/2025.
//

import SwiftUI

struct addCountryView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel : loginViewModel
    init(viewModel: loginViewModel) {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 20,content: {
                Text("What is your country or region?")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("This helps us find you more relevant content, we wont' show on your profile.")
                    .multilineTextAlignment(.center)
                ZStack(content: {
                    TextField("Country", text: $viewModel.country)
                        .EmailModifier()
                        .disabled(true)
                        .overlay(alignment: .trailing, content: {
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.gray)
                                .padding(.trailing)
                        })
                    Button(action: {viewModel.showCountryList.toggle()}, label: {
                        Rectangle().fill(.clear)
                            .frame(width: proxy.size.width * 0.9, height: 44)
                    })
                        
                })
                Spacer()
                NavigationLink(destination: {interestView(viewModel: viewModel)}, label: {
                    Text("Next")
                        .frame(width: proxy.size.width * 0.9, height: 60)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }).padding(.bottom)
            })
            .padding()
            .fullScreenCover(isPresented: $viewModel.showCountryList, content: {
                listCountryView(viewModel: viewModel)
            })
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.country = "Pakistan"
                            dismiss()
                        }
                })
                ToolbarItem(placement:.principal, content: {
                    indicatorView(numberOfScreen: 5)
                })
            }
        }
    }
}

#Preview {
    NavigationStack{
        addCountryView(viewModel: loginViewModel())
    }
}
