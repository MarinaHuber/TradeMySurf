//
//  AppCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
	var tabBarCoordinator: TabBarCoordinator?

	internal var childCoordinators: [Coordinator]
	internal var presenter: UINavigationController
	let window: UIWindow
	let rootCoordinator: WelcomeCoordinator

	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
		presenter = UINavigationController()
		self.presenter.navigationBar.backgroundColor = .clear
		self.presenter.navigationBar.barTintColor = .clear
		self.presenter.navigationBar.tintColor = .black
		self.presenter.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().layer.shadowColor = UIColor.clear.cgColor
		rootCoordinator = WelcomeCoordinator(presenter: presenter)
		presenter.setNavigationBarHidden(true, animated: false)

	}

	func start() {
//MARK: - RootViewController is UINavigationController for test
		window.rootViewController = presenter
		rootCoordinator.start()
		window.makeKeyAndVisible()
	}
}
