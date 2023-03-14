//
//  SecondPresenter.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit

protocol SecondPresentable: Presentable {
    func getArtistName()
}

final class SecondPresenter<C: SecondViewControllable>: SecondPresentable {

    weak var view: C?
    private let service: SecondService
    private let dataTransferObject: SecondDTO
    
    init(service: SecondService, dataTransferObject: SecondDTO) {
        self.service = service
        self.dataTransferObject = dataTransferObject
    }
    
    // MARK: - View Input
    func getArtistName() {
        view?.update(with: dataTransferObject.artistName)
    }
}
