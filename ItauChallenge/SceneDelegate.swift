//
//  SceneDelegate.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = ReceiptListViewController()
        let navController = UINavigationController()
        navController.view.backgroundColor = .white
        navController.setViewControllers([viewController], animated: false)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
    }
}

