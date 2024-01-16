//
//  KeyChain_ManagerApp.swift
//  KeyChain Manager
//  
//  Created by Vignesh on 04/01/24.
//

import SwiftUI
import Firebase
import FirebaseCore

@main
struct KeyChain_ManagerApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("Configured Firebase!")
    return true
  }
}

