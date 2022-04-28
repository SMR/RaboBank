//
//  AppDependency.swift
//  Rabo
//
//  Created by iSparshIT on 28/04/22.
//

import CoreData

protocol Dependency {
    var dataProvider: DataProvider { get }
}

class AppDependency: Dependency {

    let dataProvider: DataProvider = LocalCustomerDataProvider()
}
