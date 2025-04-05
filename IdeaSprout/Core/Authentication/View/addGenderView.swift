//
//  addGenderView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 05/04/2025.
//

import SwiftUI

struct addGenderView: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable private var viewModel : loginViewModel
    init(viewModel: loginViewModel)
    {
        self._viewModel = Bindable(wrappedValue: viewModel)
    }
    var body: some View {
        GeometryReader {proxy in
            VStack(spacing:20, content: {
                Text("Whats your gender?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top)
                Text("This help's us find more relevant content. we won't show it to your profile.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                Button(action: {viewModel.gender = "Male"
                    viewModel.isNavigationActive = true}, label: {
                        genderView(name: "Male", gender: $viewModel.gender, width: proxy.size.width * 0.9)
                })
                Button(action: {viewModel.gender = "Female"
                    viewModel.isNavigationActive = true}, label: {
                        genderView(name: "Female", gender: $viewModel.gender, width: proxy.size.width * 0.9)
                })
               
      
                Spacer()
                
                
            })
            .navigationDestination(isPresented: $viewModel.isNavigationActive, destination: {
                Text("Country view")
            })
            .padding()
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            viewModel.gender = ""
                            dismiss()
                        }
                })
                ToolbarItem(placement:.principal, content: {
                    indicatorView(numberOfScreen: 4)
                })
            }
        }
    }
}

#Preview {
    NavigationStack{
        addGenderView(viewModel: loginViewModel())
    }
}

struct genderView: View {
    var name : String
    @Binding var gender : String
    var width: CGFloat
    var body: some View {
        Text(name)
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(gender == name ? .white : .black)
            .frame(width: width, height: 60)
            .background(gender == name ? .red : Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
