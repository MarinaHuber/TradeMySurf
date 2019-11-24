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
	private lazy var appCoordinator: AppCoordinator = {
		return AppCoordinator(window: self.window!)
	}()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		window = UIWindow(frame: UIScreen.main.bounds)
		appCoordinator.start()
		customUI()
		return true
	}

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
}

extension AppDelegate {
	func customUI() {
		guard let navigationController = self.window?.rootViewController as? UINavigationController else { return }

		navigationController.navigationBar.backgroundColor = .clear
		navigationController.navigationBar.barTintColor = .clear
		navigationController.navigationBar.tintColor = .black
		navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().layer.shadowColor = UIColor.clear.cgColor
	}
}
