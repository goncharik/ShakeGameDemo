//
//  AppDelegate.swift
//  ShakeGame
//
//  Created by Eugene Honcharenko on 22/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = GameViewController()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        return true
    }
}

