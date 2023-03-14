//
//  SecondViewControllable.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit

protocol SecondViewControllable: Controllable {
    func update(with name: String)
}

extension SecondViewControllable {
    func processedData() {}
    func update() {}
    func delete() {}
    func getData() {}
}
