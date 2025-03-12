//
//  ContentView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 08/03/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Internet")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
