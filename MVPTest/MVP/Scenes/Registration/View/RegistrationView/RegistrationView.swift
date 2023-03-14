//
//  RegistrationView.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import UIKit

protocol RegistrationViewDataPassingDelegate: AnyObject {
    func tapPressed()
}

final class RegistrationView: UIView {
    weak var delegate: RegistrationViewDataPassingDelegate?
    
    @IBAction func tapButtonAction(_ sender: UIButton) {
        delegate?.tapPressed()
    }
}
