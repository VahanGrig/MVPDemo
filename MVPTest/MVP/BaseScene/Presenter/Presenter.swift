//
//  Presenter.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

protocol DataTransferable {}

class Presenter<C: Controllable>: Presentable {
    typealias T = C

    private let service: any Serviceable
    private let dataTransferObject: (any DataTransferable)?
    weak var view: C?

    init(service: any Serviceable, dataTransferObject: (any DataTransferable)?) {
        self.dataTransferObject = dataTransferObject
        self.service = service
    }
}
