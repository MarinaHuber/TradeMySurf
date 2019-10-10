//
//  SellTipsCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SellTipsCoordinator: Coordinator {
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []

		presenter.tabBarItem = UITabBarItem(title: "sell", image: nil, selectedImage: nil)
	}

	func start() {
//		let sellVC = SellTipsViewController.instantiate()
//		presenter.pushViewController(sellVC, animated: true)
	}
}
