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
            }) .ignoresSafeArea()
            GeometryReader{proxy in
                
                
                VStack(content: {
                    Text("Welcome to Meme World")
                        .font(.title)
                        .fontDesign(.rounded)
                        .fontWeight(.semibold)
                    TextField("Email adress", text: $viewModel.email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal,40)
                    
                    Button(action: {}, label: {
                        loginButton(color: .red, width:  proxy.size.width * 0.8, title: "Continue", imageName: "", foregroundColor: .white )
                    })
                    Button(action: {}, label: {
                        loginButton(color: .blue, width:  proxy.size.width * 0.8, title: "Continue with Facebook", imageName: "facebook", foregroundColor: .white)
                    })
                    Button(action: {}, label: {
                        loginButton(color: .gray.opacity(0.5), width:  proxy.size.width * 0.8, title: "Continue with Google", imageName: "google", foregroundColor: .black)
                    })
                    
                })
            }
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
