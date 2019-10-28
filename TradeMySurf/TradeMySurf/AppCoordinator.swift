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
		rootCoordinator = WelcomeCoordinator(presenter: presenter)
		presenter.setNavigationBarHidden(true, animated: false)

	}

	func start() {
		//MARK: rootViewController is UINavigationController for test
		window.rootViewController = presenter
		rootCoordinator.start()
		window.makeKeyAndVisible()
	}
}

