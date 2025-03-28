//
//  emptyPinView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/03/2025.
//

import SwiftUI

struct emptyPinView: View {
    @Bindable private var viewModel : savedViewModel
    init(viewModel: savedViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
       
        emptySavedView(title: "You haven't any pins...Yet", imageName: "idea", subtitle: "Saved your favourites ideas as you can easily come back to the later", buttonTitle: "Explore Pins")
    }
}

#Preview {
    emptyPinView(viewModel: savedViewModel())
}

struct emptySavedView: View {
    private var title : String
    private var imageName: String
    private var subtitle: String
    private var buttonTitle : String
    
    init(title: String, imageName: String, subtitle: String, buttonTitle: String) {
        self.title = title
        self.imageName = imageName
        self.subtitle = subtitle
        self.buttonTitle = buttonTitle
    }
    var body: some View {
        VStack(spacing: 20, content: {
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: 150, height: 150)
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
            Text(subtitle)
                .multilineTextAlignment(.center)
                .font(.subheadline)
            
            
            Button(action: {}, label: {
                Text(buttonTitle)
                    .padding(20)
                    .foregroundStyle(.white)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .background(Color(.red))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            })
            Spacer()
            
        })
    }
}


