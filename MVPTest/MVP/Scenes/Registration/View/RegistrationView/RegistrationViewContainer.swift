//
//  RegistrationViewContainer.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 10.03.23.
//

import UIKit

final class RegistrationViewContainer: View {

    var mainView = RegistrationView.loadFromNib()

    override init() {
        super.init()
        addSubviewWithConstraints(mainView)
    }
}
