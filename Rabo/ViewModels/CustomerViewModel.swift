//
//  CustomerViewModel.swift
//  Rabo
//
//  Created by iSparshIT on 28/04/22.
//

import UIKit

struct CustomerViewModel {
    let name: String
    let borderSides: BorderLayer.Side
    
    init(customer: Customer, borderSides: BorderLayer.Side) {
        let nameFormat = NSLocalizedString("%@ %@", comment: "Full name")
        name = String.localizedStringWithFormat(nameFormat, customer.firstName, customer.surName)
        self.borderSides = borderSides
    }
}

