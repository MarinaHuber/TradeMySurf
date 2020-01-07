//
//  AppDelegate.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var coordinator: CoordinatorTest? = nil
    var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// configure Coordinators
        guard let window = window else { fatalError() }
       // window = UIWindow(frame: UIScreen.main.bounds)
        coordinator = CoordinatorTest(window: window)
        return true

		// configure Fonts missing
        FontHelper.registerAllFonts()
        customiseNavBar()

		return true
	}
    override var next: UIResponder? {
        return coordinator
    }

    
    func customiseNavBar () {
        guard let navigationController = self.window?.rootViewController as? UINavigationController else { return }
        navigationController.navigationBar.barTintColor = .clear
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
    }
}
