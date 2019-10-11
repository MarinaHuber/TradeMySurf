//
//  TabBarCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinator {

	internal var presenter: UINavigationController
	internal var tabBarController: UITabBarController?
	internal var childCoordinators: [Coordinator]

	init(tabBarController: UITabBarController, nav: UINavigationController) {
		self.tabBarController = tabBarController
		childCoordinators = []
		self.presenter = nav
		presenter.navigationBar.prefersLargeTitles = true
		presenter.navigationBar.topItem?.title = "Kelly my surf"
	}


	func start() {
		performGetTabBar()
	}

	private func generateTabCoordinators() -> [Coordinator] {
		let buyCoordinator: BuyTipsCoordinator = BuyTipsCoordinator(presenter: UINavigationController())
		let calculatorCoordinator: CalculatorCoordinator = CalculatorCoordinator(presenter: UINavigationController())
		let sellCoordinator: SellTipsCoordinator = SellTipsCoordinator(presenter: UINavigationController())
		return [buyCoordinator, calculatorCoordinator, sellCoordinator]
	}

	func performGetTabBar() {
		let coordinators: [Coordinator] = generateTabCoordinators()

		coordinators.forEach({ coordinator in
			coordinator.start()
			addChildCoordinator(coordinator: coordinator)

		})

		let presenters: [UINavigationController] = coordinators.map({ coordinator -> UINavigationController in
			coordinator.presenter
		})
		tabBarController?.setViewControllers(presenters, animated: false)
		selectTab(type: CalculatorCoordinator.self)
	}
}

extension TabBarCoordinator {

	func selectTab<T: Coordinator>(type _: T.Type) {
		guard let index = childCoordinators.firstIndex(where: { coordinator in
			coordinator is T
		}) else {
			return
		}

		tabBarController?.selectedIndex = index
	}
}
