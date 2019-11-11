//
//  SellTipsCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SellTipsCoordinator: Coordinator {
	var coordinator: SellTipsCoordinator?
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []
		
//		presenter.tabBarItem = UITabBarItem(title: "Passed trips", image: nil, selectedImage: nil)
	}

	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: "Saved", bundle: nil)
		let viewController: SellTipsViewController = SellTipsViewController.instantiate(from: storyboard)
		presenter.pushViewController(viewController, animated: true)
	}
}
