//
//  AppDelegate.swift
//  SwiftRepositories
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupFirstScreen()
        return true
    }
    
    private func setupFirstScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let viewController = RepositoriesViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
