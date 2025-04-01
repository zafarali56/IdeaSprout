//
//  loginView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 29/03/2025.
//

import SwiftUI

struct loginView: View {
    @State private var viewModel = loginViewModel()
    var body: some View {
        
        NavigationStack{
            ZStack(content: {
                LinearGradient(colors: [.white,.blue], startPoint: .bottom, endPoint: .top)
            })
            .ignoresSafeArea()
            GeometryReader{proxy in
                
                
                VStack(content: {
                    Text("Welcome to Meme World")
                        .font(.title)
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                    TextField("Email adress", text: $viewModel.email)
                        .EmailModifier()

                    
                    Button(action: {
                        Task(operation: {
                            if try await viewModel.checkEmailExists(){
                                viewModel.showSingInView.toggle()
                            }
                            else{
                                viewModel.showAddPassword.toggle()
                            }
                        })
                       
                    }, label: {
                        loginButton(color: .red, width:  proxy.size.width * 0.8, title: "Continue", imageName: "", foregroundColor: .white )
                    })
                    Button(action: {}, label: {
                        loginButton(color: .blue, width:  proxy.size.width * 0.8, title: "Continue with Facebook", imageName: "facebook", foregroundColor: .white)
                    })
                    Button(action: {}, label: {
                        loginButton(color: .gray.opacity(0.5), width:  proxy.size.width * 0.8, title: "Continue with Google", imageName: "google", foregroundColor: .black)
                    })
                    Spacer()

                    Text("By continuing, you agree to Meme world's")
                        .font(.footnote)
                    +
                    Text("Terms of services ")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                    +
                    Text("and acknowledge that you've read our ")
                    +
                    Text("privacy policy. Notice at collection")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                    
                })

                
            }.padding(.horizontal)
                .fullScreenCover(isPresented: $viewModel.showSingInView, content: {
                    signInView(viewModel: viewModel)

                })
                .navigationDestination(isPresented: $viewModel.showAddPassword, destination: {
                    addPasswordView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                })
                
        }
    }
}

#Preview {
    loginView()
}

struct loginButton: View {
    private var color: Color
    private var width: CGFloat
    private var title: String
    private var imageName: String?
    private var foregroundColor: Color
    init(color: Color, width: CGFloat, title: String, imageName: String, foregroundColor: Color) {
        self.color = color
        self.width = width
        self.title = title
        self.imageName = imageName
        self.foregroundColor = foregroundColor
    }
    var body: some View {
        HStack(content: {
   
            if let imageName = imageName{
                Image(imageName)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading)
                
            }
            Spacer()
            
            Text(title)
               
                .font(.headline)
                .frame(width:width, height: 50)
            Spacer()
        })
        .background(color)
        .foregroundStyle(foregroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
