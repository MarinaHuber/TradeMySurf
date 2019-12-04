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
		self.presenter.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
		self.presenter.navigationBar.shadowImage = UIImage()
		self.presenter.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
		presenter.setNavigationBarHidden(true, animated: false)
		rootCoordinator = WelcomeCoordinator(presenter: presenter)
	}

	func start() {
//MARK: - RootViewController is UINavigationController for test
		window.rootViewController = presenter
		rootCoordinator.start()
		window.makeKeyAndVisible()
	}
}
