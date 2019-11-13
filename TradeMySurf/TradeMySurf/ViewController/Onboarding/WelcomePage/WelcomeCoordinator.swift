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
		let mainVC = WelcomeViewController.instantiate()
		mainVC.delegate = self
		presenter.pushViewController(mainVC, animated: true)
	}
}

extension WelcomeCoordinator : WelcomeViewControllerDelegate {
	func performTabBar() {
		let coordinator: TabBarCoordinator = TabBarCoordinator(tabBarController: UITabBarController())
        addChildCoordinator(coordinator: coordinator)
		coordinator.start()
		presenter.show(coordinator.tabBarController!, sender: nil)
		//(coordinator.tabBarController!, animated: true, completion: nil)
		self.tabBar = coordinator
		
	}


}
