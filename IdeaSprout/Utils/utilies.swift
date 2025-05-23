//
//  utilies.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 29/04/2025.
//

import Foundation
import UIKit


final class Utilites {
	static let shared = Utilites()
	
	private init(){
		
	}
	@MainActor
	func topViewController (controller: UIViewController? = nil)-> UIViewController?{
		let controller = controller ?? UIApplication.shared.keyWindow?.rootViewController
		if let navigationController = controller as? UINavigationController{
			return topViewController(controller: navigationController.visibleViewController)
		}
		if let tabController = controller as? UITabBarController{
			if let selected = tabController.selectedViewController{
				return topViewController(controller: selected)
			}
		}
		
		if let presented = controller?.presentedViewController{
			return topViewController(controller: presented)
		}
		return controller
		
	}
}
