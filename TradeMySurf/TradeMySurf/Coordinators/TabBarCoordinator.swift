//
//  TabBarCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

// https://github.com/giulio92/Coordinator
// https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios
// *******************************************************************************************

final class TabBarCoordinator: NSObject, Coordinator {

	internal var presenter: UINavigationController
	internal var tabBarController: UITabBarController?
	internal var childCoordinators: [Coordinator]	

	init(window: UIWindow, tabBarController: UITabBarController) {
		self.tabBarController = tabBarController
		childCoordinators = []
		self.presenter = UINavigationController()
        self.presenter.navigationBar.barTintColor = .white
        self.presenter.navigationBar.tintColor = .black
        self.presenter.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
	}
	 func start() {
		performGetTabBar()
	}
	private func performGetTabBar() {
		let coordinators: [Coordinator] = generateTabCoordinators()

		coordinators.forEach({ coordinator in
			coordinator.start()
			addChildCoordinator(coordinator)
		})

		let presenters: [UIViewController] = coordinators.map({ coordinator -> UIViewController in
            coordinator.presenter.setNavigationBarHidden(true, animated: false)
            let button = UIButton(type: .system)
            button.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
            button.sizeToFit()
            button.addTarget(self, action: #selector(popToRoot(sender:)), for: .touchUpInside)
            let leftBtn = UIBarButtonItem(customView: button)
            leftBtn.style = .plain
            tabBarController?.navigationItem.leftBarButtonItem = leftBtn // this removes default navigation back button
			return coordinator.presenter
		})
		tabBarController?.setViewControllers(presenters, animated: false)
		selectTab(type: SurfTripCoordinator.self)
	}

	private func generateTabCoordinators() -> [Coordinator] {
		let calculatorCoordinator: CalculatorCoordinator = CalculatorCoordinator(presenter: UINavigationController())
		let tripCoordinator: SurfTripCoordinator = SurfTripCoordinator(presenter: UINavigationController())
		let sellCoordinator: SavedTripsCoordinator = SavedTripsCoordinator(presenter: UINavigationController())
		return [calculatorCoordinator, tripCoordinator, sellCoordinator]
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
    
    @objc private func popToRoot(sender: UIBarButtonItem) {
        //self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
}
