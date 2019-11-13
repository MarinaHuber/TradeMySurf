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
	func performNextView() {

		let addLevelCoordinator: AddLevelViewCoordinator = AddLevelViewCoordinator(presenter: UINavigationController())
		addLevelCoordinator.start()
		addChildCoordinator(coordinator: addLevelCoordinator)
		presenter.present(addLevelCoordinator.presenter, animated: true, completion: nil)
	}
}
