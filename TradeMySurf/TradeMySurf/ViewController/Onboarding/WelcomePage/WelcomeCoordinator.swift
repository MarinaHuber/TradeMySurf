//
//  OnboardingCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class WelcomeCoordinator: Coordinator {

	var tabBar : TabBarCoordinator?
	var tabBarController: UITabBarController?
	internal var presenter: UINavigationController
	var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []
	}
	func start() {
		let mainViewController = WelcomeViewController.instantiate()
		mainViewController.delegate = self
		presenter.pushViewController(mainViewController, animated: true)
	}
}

extension WelcomeCoordinator : WelcomeViewControllerDelegate {
	func performTabBar() {
		let coordinator: TabBarCoordinator = TabBarCoordinator(tabBarController: UITabBarController())
        addChildCoordinator(coordinator: coordinator)
		coordinator.start()
		presenter.present(coordinator.tabBarController!, animated: true, completion: nil)
		self.tabBar = coordinator		
	}
}
