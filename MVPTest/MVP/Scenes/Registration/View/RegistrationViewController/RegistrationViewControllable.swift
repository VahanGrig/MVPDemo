//
//  RegistrationViewControllable.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import UIKit

protocol RegistrationViewControllable: Controllable {
    func getArtistName(_ name: String)
}

extension RegistrationViewControllable {
    func processedData() {}
    func update() {}
    func delete() {}
    func getData() {}
}
