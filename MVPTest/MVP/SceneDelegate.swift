//
//  SceneDelegate.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        window.makeKeyAndVisible()
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}
