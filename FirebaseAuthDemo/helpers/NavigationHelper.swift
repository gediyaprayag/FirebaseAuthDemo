//
//  NavigationHelper.swift
//  FirebaseAuthDemo
//
//  Created by Prayag Gediya on 06/02/21.
//

import UIKit
import SwiftUI

class Navigate: NSObject {
    
    private override init() {
        
    }
    
    static let to = Navigate()
    
    func homeView() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        if let windowScenedelegate = scene?.delegate as? SceneDelegate {
            let window = UIWindow(windowScene: scene!)
            window.rootViewController = UIHostingController(rootView: ContentView())
            windowScenedelegate.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func loginView() {
        let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        if let windowScenedelegate = scene?.delegate as? SceneDelegate {
            let window = UIWindow(windowScene: scene!)
            window.rootViewController = UIHostingController(rootView: LoginView())
            windowScenedelegate.window = window
            window.makeKeyAndVisible()
        }
    }
    
}
