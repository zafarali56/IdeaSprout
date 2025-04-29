//
//  IdeaSproutApp.swift
//  IdeaSprout
//
//  Created by Zafar ‎ on 08/03/2025.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
func application(_ app: UIApplication,
				 open url: URL,
				 options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
  return GIDSignIn.sharedInstance.handle(url)
}

@main
struct IdeaSproutApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
			rootView()
        }
    }
}
