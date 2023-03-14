//
//  RegistrationService.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import Foundation

final class RegistrationService: IServiceable {
    let resource: RegResource

    init(resource: RegResource) {
        self.resource = resource
    }

    func getAnimeArtist() async throws -> Artists {
        var res: RegResponse?
        try await res = execute()
        let result = Artists(results: res?.results ?? [])
        return result
    }
}
