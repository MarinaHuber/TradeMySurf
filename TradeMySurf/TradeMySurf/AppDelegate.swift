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
	private lazy var appCoordinator: LoadingStateCoordinator = {
		return LoadingStateCoordinator(window: self.window!)
	}()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// configure Coordinators
		window = UIWindow(frame: UIScreen.main.bounds)
		appCoordinator.start()
		window?.makeKeyAndVisible()

		// configure Fonts missing
        FontHelper.registerAllFonts()

		return true
	}
}
