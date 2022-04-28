//
//  DetailsCoordinatorTests.swift
//  RaboTests
//
//  Created by iSparshIT on 28/04/22.
//

import XCTest
import CoreData
@testable import Rabo

class DetailsCoordinatorTests: XCTestCase {

    var dependency: MockDependency?
    var coordinator: DetailsCoordinator<MockDependency>?
    let customer = Customer.mockCustomer()

    override func setUp() {
        super.setUp()

        let navigation = UINavigationController(rootViewController: UIViewController())
        let localDependency = MockDependency()
        dependency = localDependency
        if let customer = customer {
            coordinator = DetailsCoordinator(
                dependency: localDependency,
                navigation: navigation,
                customer: customer
            )
        }
    }

    override func tearDown() {
        coordinator = nil
        dependency = nil
        super.tearDown()
    }

    func testInit() {
        XCTAssertNotNil(dependency)
        XCTAssertNotNil(coordinator)
    }
}
