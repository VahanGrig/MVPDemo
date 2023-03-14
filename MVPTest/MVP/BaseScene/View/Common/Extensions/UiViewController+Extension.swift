//
//  UiViewController+Extension.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit

extension UIViewController {

    func setupCloseButtonItem(imageName: String? = nil,
                              color: UIColor = .darkGray,
                              selector: Selector = #selector(closeButtonItemAction)) {
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: selector)

        if let imageName {
            backButtonItem.image = UIImage(named: imageName)
        } else {
            backButtonItem.image = UIImage(systemName: "xmark")
        }
    
        backButtonItem.tintColor = color
        self.navigationItem.leftItemsSupplementBackButton = false
        self.navigationItem.leftBarButtonItem = backButtonItem
    }
    
    func setupBackButtonItem(imageName: String? = nil,
                             toRoot: Bool? = false,
                             action: Selector? = #selector(backButtonItemAction)) {
        
        var backButtonItem = UIBarButtonItem()
        
        if toRoot ?? false {
            backButtonItem = UIBarButtonItem(title: "",
                                             style: .plain,
                                             target: self,
                                             action: #selector(backToRootButtonItemAction))
            
        } else {
            backButtonItem = UIBarButtonItem(title: "",
                                             style: .plain,
                                             target: self,
                                             action: #selector(backButtonItemAction))
        }
        
        let image = (imageName != nil) ?
        UIImage(named: imageName ?? "") :
        UIImage(systemName: "arrowshape.backward")

        backButtonItem.image = image
        backButtonItem.tintColor = .black
        navigationItem.leftItemsSupplementBackButton = false
        navigationItem.leftBarButtonItem = backButtonItem
    }

    @objc func closeButtonItemAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func backButtonItemAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func backToRootButtonItemAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}
