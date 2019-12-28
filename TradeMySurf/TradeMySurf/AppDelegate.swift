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

	var window: UIWindow?
	private lazy var appCoordinator: SplashMainCoordinator = {
		return SplashMainCoordinator(window: self.window!)
	}()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// configure Coordinators
		window = UIWindow(frame: UIScreen.main.bounds)
		appCoordinator.start()
		window?.makeKeyAndVisible()

		// configure Fonts missing
        FontHelper.registerAllFonts()
        customiseNavBar()

		return true
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
