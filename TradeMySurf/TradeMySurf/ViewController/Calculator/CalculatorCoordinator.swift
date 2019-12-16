//
//  CalculatorCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class CalculatorCoordinator: Coordinator {
	internal var presenter: UINavigationController

	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []

		presenter.tabBarItem = UITabBarItem(title: "CALCULATOR", image: nil, selectedImage: nil)
	}

	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.priceCalculatorViewController, bundle: nil)
		let viewController: PriceCalculatorViewController = PriceCalculatorViewController.instantiate(from: storyboard)
		presenter.pushViewController(viewController, animated: true)
	}
}
