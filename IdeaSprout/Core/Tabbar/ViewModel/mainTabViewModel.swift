//
//  mainTabViewModel.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 15/03/2025.
//

import Foundation
import Observation
import UIKit
@Observable
class mainTabViewModel{
    var selectedTab : Int = 0
    var showCreateMenu: Bool = false
    var isFullScreen : Bool = false
    init()
    {
        configureTabBarAppearence()
    }
    
    private func configureTabBarAppearence ()
    {
        UIView
            .appearance(
                whenContainedInInstancesOf: [UITabBarController.self]
            ).tintColor = .red
    }
    
    
}
