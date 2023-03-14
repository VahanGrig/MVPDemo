//
//  SecondService.swift
//  MVPTest
//
//  Created by Vahe Abazyan on 13.03.23.
//

import UIKit

final class SecondService: IServiceable {
    let resource: SecondResource
    
    init(resource: SecondResource) {
        self.resource = resource
    }
}
