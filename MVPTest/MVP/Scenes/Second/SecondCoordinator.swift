//
//  SecondCoordinator.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit

protocol SecondCoordinatorDelegate: AnyObject {
    func isRead()
}

final class SecondCoordinator: BaseCoordinator<UINavigationController> {

    weak var delegate: SecondCoordinatorDelegate?

    func start(with dto: SecondDTO) {
        let vc = SecondViewController.build(with: dto, delegate: self)
        vc.coordinator = self
        DispatchQueue.main.async { [weak self] in
            self?.rootViewController.pushViewController(vc, animated: true)
        }
    }
}

extension SecondCoordinator: SecondViewControllerDelegate {
    func isRead() {
        delegate?.isRead()
        back()
    }
}
