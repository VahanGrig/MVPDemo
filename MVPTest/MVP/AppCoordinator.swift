//
//  AppCoordinator.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import UIKit

public final class AppCoordinator: Coordinator {

    private var window: UIWindow

    var registrationCoordinator: RegistrationCoordinator?
    let mainNavigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showMainScene()
    }

    func showMainScene() {
        mainNavigationController.isNavigationBarHidden = true
        registrationCoordinator = RegistrationCoordinator(rootViewController: mainNavigationController)
        registrationCoordinator?.start()
        window.rootViewController = registrationCoordinator?.rootViewController
     }

    func back() {
        fatalError()
    }

    func backToRoot() {
        fatalError()
    }
}
