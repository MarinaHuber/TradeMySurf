//
//  AddDateCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/11/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class AddDateCoordinator: Coordinator {

	var tabBar : TabBarCoordinator?
	var tabBarController: UITabBarController?
	internal var presenter: UINavigationController
	var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []
	}
	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addDateViewController, bundle: nil)
		let dateController: AddDateViewController = AddDateViewController.instantiate(from: storyboard)
		dateController.delegate = self
		presenter.pushViewController(dateController, animated: true)
	}
}

extension AddDateCoordinator : AddDateViewControllerDelegate {
	func performTabBar() {
		let coordinator: TabBarCoordinator = TabBarCoordinator(tabBarController: UITabBarController())
		addChildCoordinator(coordinator: coordinator)
		coordinator.start()
		presenter.show(coordinator.tabBarController!, sender: nil)
		self.tabBar = coordinator
	}
}
