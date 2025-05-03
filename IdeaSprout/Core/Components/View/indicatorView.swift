//
//  indicatorView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 02/04/2025.
//

import SwiftUI

struct indicatorView: View {
	var numberOfScreen: Int
	var totalScreens: Int = 6 // Assuming a total of 6 screens

	var body: some View {
		HStack {
			ForEach(0..<totalScreens, id: \.self) { index in
				if index < numberOfScreen {
					Circle()
						.fill(Color(.darkGray))
						.frame(width: 8, height: 8)
				} else if index == numberOfScreen {
					Circle()
						.stroke(Color(.darkGray), lineWidth: 3)
						.frame(width: 7, height: 8)
				} else {
					Circle()
						.fill(Color(.gray))
						.frame(width: 8, height: 8)
				}
			}
		}
	}
}

#Preview {
	indicatorView(numberOfScreen: 1)
}
