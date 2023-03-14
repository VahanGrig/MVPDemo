//
//  Presentable.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 09.03.23.
//

import Foundation

protocol Presentable {
    associatedtype T: Controllable
    var view: T? { set get }
}
