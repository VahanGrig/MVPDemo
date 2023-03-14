//
//  SecondView.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit


protocol SecondViewDelegate: AnyObject {
    func isRead()
}

final class SecondView: UIView {
    
    weak var delegate: SecondViewDelegate?
    
    @IBOutlet private weak var artistName: UILabel!
    @IBOutlet private weak var readButton: UIButton!

    
    func setArtistName(_ name: String) {
        artistName.text = name
    }
    
    @IBAction func readButtonAction(_ sender: Any) {
        delegate?.isRead()
    }
}
