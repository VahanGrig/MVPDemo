//
//  RegistrationResource.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import Foundation

struct RegResource: IResource {
    typealias Response = RegResponse
    var body: RegBody?
    var path = "neko"
}
