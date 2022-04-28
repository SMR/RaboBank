//
//  AppDelegate.swift
//  Rabo
//
//  Created by iSparshIT on 27/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var dependency = AppDependency()
    lazy var appCoordinator = AppCoordinator(dependency: dependency)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }
}
