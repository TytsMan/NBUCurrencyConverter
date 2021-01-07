//
//  AppDelegate.swift
//  NBUCurrencyConverter
//
//  Created by Ivan Dekhtiarov on 06.01.2021.
//  Copyright © 2021 Ivan Dekhtiarov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let navigationController = UINavigationController.init(rootViewController: ViewController())
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

