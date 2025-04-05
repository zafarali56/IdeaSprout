//
//  indicatorView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 02/04/2025.
//

import SwiftUI

struct indicatorView: View {
       var numberOfScreen : Int
        var body: some View {
            HStack(content: {
                ForEach(0..<6-numberOfScreen, id: \.self){_ in
                Circle().fill(Color(.darkGray))
                    .frame(width: 8, height: 8)
                Circle()
                    .stroke(Color(.darkGray), lineWidth: 3)
                    .frame(width: 7, height: 8)
                    ForEach(0..<6-numberOfScreen, id: \.self){_ in
                        Circle()
                            .fill(Color(.gray))
                            .frame(width: 8, height: 8)
               }
            }
        })
    }
}

#Preview {    indicatorView(numberOfScreen: 1)
}
