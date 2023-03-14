//
//  RegistrationPresenter.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import Foundation

protocol RegistrationPresentable: Presentable {
    func getArtistInfo() async
}

final class RegistrationPresenter<C: RegistrationViewControllable>: RegistrationPresentable {

    weak var view: C?
    private let service: RegistrationService
    
    init(service: RegistrationService) {
        self.service = service
    }
    
    // MARK: - RegistrationPresentable
    func getArtistInfo() async {
        let result = try? await service.getAnimeArtist()
        let artistName = result?.results.first?.artist_name
        view?.getArtistName(artistName ?? "")
    }
}
