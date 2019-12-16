//
//  SellTipsCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SavedTripsCoordinator: Coordinator {
	var coordinator: SavedTripsCoordinator?
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []

	}

	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.savedTripsViewController, bundle: nil)
		let viewController: SavedTripsViewController = SavedTripsViewController.instantiate(from: storyboard)
		presenter.pushViewController(viewController, animated: true)
	}
}
