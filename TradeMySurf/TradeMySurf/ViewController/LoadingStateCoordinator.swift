//
//  LoadingStateCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class LoadingStateCoordinator: Coordinator {
	var presenter: UINavigationController
	let window = UIWindow()
	var tabBar : TabBarCoordinator?

	var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		childCoordinators = []
		self.presenter = presenter
	}

	func start() {
		//if StorageData.didUserSetUp == true {
//			let coordinator = TabBarCoordinator(tabBarController: UITabBarController())
//			let tabBarVC = coordinator.tabBarController
//			window.rootViewController = tabBarVC
//
//	//	} else {
//			let welcomeVC = WelcomeViewController()
//			window.rootViewController = welcomeVC
//		}
	}
}
