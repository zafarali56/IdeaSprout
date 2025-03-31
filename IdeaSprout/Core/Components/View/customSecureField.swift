//
//  customSecureField.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 31/03/2025.
//


import SwiftUI

struct customSecureField: View {
    var width : CGFloat
    @Binding var isSecureField : Bool
    @Binding var password: String

    var body: some View {
        ZStack(alignment: .trailing, content: {
            if isSecureField{
                SecureField("Password", text: $password)
                    .EmailModifier()
                    .frame(width: width)
            }
            else{
                TextField("Password", text:$password)
                    .EmailModifier()
                    .frame(width: width)
            }
            Image(systemName: !isSecureField ? "eye.slash.fill" : "eye.fill")
                .padding(.trailing)
                .foregroundStyle(.gray)
                .onTapGesture {
                    isSecureField.toggle()
                }
        })
    }
}

