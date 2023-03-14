//
//  RegistrationCoordinator.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import UIKit

final class RegistrationCoordinator: BaseCoordinator<UINavigationController> {

    var registrationVc: RegistrationViewController?
    
    override func start() {
        let vc = RegistrationViewController.build()
        vc.coordinator = self
        registrationVc = vc
        rootViewController.pushViewController(vc, animated: true)
    }
    
    func coordinateToSecondVC(with dto: SecondDTO) {
        DispatchQueue.main.async {
            let navigationVC = UINavigationController()
            navigationVC.navigationController?.isNavigationBarHidden = false
            let secondVCCoordinator = SecondCoordinator(rootViewController: self.rootViewController)
            secondVCCoordinator.delegate = self
            secondVCCoordinator.start(with: dto)
        }
    }
}

extension RegistrationCoordinator: SecondCoordinatorDelegate {
    func isRead() {
        registrationVc?.printIsRead()
    }
}
