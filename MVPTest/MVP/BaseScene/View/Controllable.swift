//
//  Controlable.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

protocol Controllable: UIViewController {
    func processedData()
    func getData()
    func update()
    func delete()
}
 

