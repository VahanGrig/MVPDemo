//
//  SecondViewContainer.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit

final class SecondViewContainer: View {

    var mainView = SecondView.loadFromNib()
    weak var delegate: SecondViewDelegate?
    
    override init() {
        super.init()
        addSubviewWithConstraints(mainView)
        self.delegate = mainView.delegate
    }
}
