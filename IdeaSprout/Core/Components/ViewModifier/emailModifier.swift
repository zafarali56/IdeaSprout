//
//  emailModifier.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 31/03/2025.
//

import Foundation
import SwiftUI

struct emailModifier : ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(12)
            .overlay(content: {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            })
    }
}


extension View{
    public func EmailModifier() -> some View {
        modifier(emailModifier())
    }
}
