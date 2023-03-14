//
//  ViewController.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import UIKit

/// Base class for view controllers with programmatically created `View`.
/// In child View Controller of this class, set View class, to access it by customView variable.
class ViewController<View: UIView,
                     C: Coordinator,
                     T: Presentable>: UIViewController,
                                      UIGestureRecognizerDelegate {
    /// Custom View
    let customView: View

    ///Presenter
    let presenter: T

    ///Coordinator
    var coordinator: C?

    /// Initializes view controller with given View
    init(presenter: any Presentable) {
        customView = View()
        self.presenter = presenter as! T

        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// - SeeAlso: UIViewController.loadView()
    override func loadView() {
        view = customView
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
