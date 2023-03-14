//
//  RegistrationViewController.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import UIKit

final class RegistrationViewController: ViewController<RegistrationViewContainer,
                                        RegistrationCoordinator,
                                        RegistrationPresenter<RegistrationViewController>> {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.mainView.delegate = self
    }
}

// MARK: - PresenterDelegate
extension RegistrationViewController: RegistrationViewControllable {
    func getArtistName(_ name: String) {
        guard let coordinator else { return }

        coordinator.coordinateToSecondVC(with: SecondDTO(artistName: name))
    }
}

// MARK: - ViewDelegate
extension RegistrationViewController: RegistrationViewDataPassingDelegate {
    func tapPressed() {
        Task {
            await presenter.getArtistInfo()
        }
    }
}

// MARK: - CoordinatorMethods
extension RegistrationViewController {
    func printIsRead() {
        print("IS READ!!")
    }
}

// MARK: - Builder
extension RegistrationViewController {
    static func build() -> RegistrationViewController {
        let service = RegistrationService(resource: RegResource())
        let presenter = RegistrationPresenter<RegistrationViewController>(service: service)
        let vc = RegistrationViewController(presenter: presenter)
        presenter.view = vc

        return vc
    }
}
