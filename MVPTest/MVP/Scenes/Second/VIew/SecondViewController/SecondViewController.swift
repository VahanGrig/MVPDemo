//
//  SecondViewController.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit


protocol SecondViewControllerDelegate: AnyObject {
    func isRead()
}

final class SecondViewController: ViewController<SecondViewContainer,
                                  SecondCoordinator,
                                  SecondPresenter<SecondViewController>> {

    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        customView.mainView.delegate = self
        presenter.getArtistName()
    }
    
    private func setupUI () {
        setupBackButtonItem()
        navigationController?.isNavigationBarHidden = false
    }
}

extension SecondViewController: SecondViewControllable {
    func update(with name: String) {
        customView.mainView.setArtistName(name)
    }
}

extension SecondViewController: SecondViewDelegate {
    func isRead() {
        delegate?.isRead()
    }
}

// MARK: - Builder
extension SecondViewController {
    static func build(with dto: SecondDTO,
                      delegate: SecondViewControllerDelegate) -> SecondViewController {
        let service = SecondService(resource: SecondResource())
        let presenter = SecondPresenter<SecondViewController>(service: service,
                                                              dataTransferObject: dto)
        let vc = SecondViewController(presenter: presenter)
        vc.delegate = delegate
        presenter.view = vc

        return vc
    }
}

