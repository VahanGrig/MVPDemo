//
//  View.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

class View: UIView {
    /// Indicating if keyboard should be closed on touch
    var closeKeyboardOnTouch = true

    /// - SeeAlso: NSCoding.init?(coder:)
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Initialize an instance and calls required methods
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 1_000, height: 1_000))
    }

    /// - SeeAlso: UIView.touchesBegan()
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if closeKeyboardOnTouch {
            endEditing(true)
        }
    }
}
