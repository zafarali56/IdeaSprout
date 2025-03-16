//
//  TitleModifier.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 16/03/2025.
//

import Foundation
import SwiftUI

struct titleModifier : ViewModifier {
    func body(content: Content)-> some View {
        content
            .font(.subheadline)
            .foregroundStyle(Color(.darkGray))
            .padding(.top)
    }
}

extension View{
    public func TitleModifier () -> some View {
       modifier(titleModifier())
    }
}
