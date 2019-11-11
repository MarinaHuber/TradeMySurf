//
//  AddLevelViewCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/11/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class AddLevelViewCoordinator: Coordinator {
	internal var presenter: UINavigationController

	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		self.childCoordinators = []

	}
	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: "AddLevelViewController", bundle: nil)
		let viewController: AddLevelViewController = AddLevelViewController.instantiate(from: storyboard)
		viewController.delegate = self
		presenter.pushViewController(viewController, animated: true)
	}

}

extension AddLevelViewCoordinator : AddLevelViewControllerDelegate {
	func performNext() {

		let addDateCoordinator: AddDateCoordinator = AddDateCoordinator(presenter: UINavigationController())
		addChildCoordinator(coordinator: addDateCoordinator)
		addDateCoordinator.start()
		presenter.present(addDateCoordinator.presenter, animated: true, completion: nil)
	}
}
