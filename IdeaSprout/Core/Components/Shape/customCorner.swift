//
//  customCorner.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 22/03/2025.
//

import Foundation
import SwiftUI

struct customCorner : Shape{
    let radius : CGFloat
    let corner: UIRectCorner
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect:rect,byRoundingCorners: corner, cornerRadii:CGSize(width: radius, height: radius) )
        return Path(path.cgPath)
        
    }
}
