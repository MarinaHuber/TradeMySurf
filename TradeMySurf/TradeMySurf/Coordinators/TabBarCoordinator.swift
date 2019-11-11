//
//  TabBarCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

// kudos Coordinator-Example by G. Lombardo & Hacking with swift
// https://github.com/giulio92/Coordinator
// https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios
// no Main.storyboard
// define protocol for loading storyboard
// define RootViewController
// from Main AppCoordinator navigate and create flow
// Crate programmatic tabBar Coordinator with children for tab VC
// Test the Coordinator flow in Project Tests
// *******************************************************************************************

final class TabBarCoordinator: Coordinator {

	internal var presenter: UINavigationController
	internal var tabBarController: UITabBarController?
	internal var childCoordinators: [Coordinator]

	init(tabBarController: UITabBarController) {
		self.tabBarController = tabBarController
		childCoordinators = []
		self.presenter = UINavigationController()
	}

	func start() {
		performGetTabBar()
	}

	private func performGetTabBar() {
		let coordinators: [Coordinator] = generateTabCoordinators()

		coordinators.forEach({ coordinator in
			coordinator.start()
			addChildCoordinator(coordinator: coordinator)
		})

		let presenters: [UINavigationController] = coordinators.map({ coordinator -> UINavigationController in
			coordinator.presenter.navigationBar.prefersLargeTitles = true
			coordinator.presenter.navigationBar.topItem?.title = "Kelly my surf"
			return coordinator.presenter
		})
		tabBarController?.setViewControllers(presenters, animated: false)
		selectTab(type: CalculatorCoordinator.self)
	}

	private func generateTabCoordinators() -> [Coordinator] {
		let buyCoordinator: BuyTipsCoordinator = BuyTipsCoordinator(presenter: UINavigationController())
		let calculatorCoordinator: CalculatorCoordinator = CalculatorCoordinator(presenter: UINavigationController())
		let sellCoordinator: SavedTripsCoordinator = SavedTripsCoordinator(presenter: UINavigationController())
		return [buyCoordinator, calculatorCoordinator, sellCoordinator]
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
