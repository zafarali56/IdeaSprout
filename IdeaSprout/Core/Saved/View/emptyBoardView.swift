//
//  emptyBoardView.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 28/03/2025.
//

import SwiftUI

struct emptyBoardView: View {
    @Bindable private var viewModel: savedViewModel
    init(viewModel: savedViewModel) {
        self._viewModel = Bindable(viewModel)
    }
    var body: some View {
        emptySavedView(title: "Keep track of what inspires you", imageName: "board", subtitle: "Board helps you organize the pins you save into collections", buttonTitle: "Create board")
    }
}

#Preview {
    emptyBoardView(viewModel: savedViewModel())
}
