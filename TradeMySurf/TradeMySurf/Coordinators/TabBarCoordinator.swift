//
//  TabBarCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class TabBarCoordinator: Coordinator {

    enum Tab: Int {
        case sell = 0
        case buy = 1
        case calculate = 2
    }

	var presenter: UINavigationController
	let tabBarController: UITabBarController
    var childCoordinators: [Coordinator]

	init(tabBarController: UITabBarController, nav: UINavigationController) {
        self.tabBarController = tabBarController
        childCoordinators = []
		self.presenter = nav
    }


    func start() {
        let coordinators: [Coordinator] = generateTabCoordinators()

        coordinators.forEach({ coordinator in
            coordinator.start()
            addChildCoordinator(coordinator: coordinator)
        })

        let presenters: [UINavigationController] = coordinators.map({ coordinator -> UINavigationController in
            coordinator.presenter
        })

        tabBarController.setViewControllers(presenters, animated: false)

       // selectTab(type: SellTipsCoordinator.self)
    }

    private func generateTabCoordinators() -> [Coordinator] {
        let menuCoordinator: BuyTipsCoordinator = BuyTipsCoordinator(presenter: UINavigationController())
        let homeCoordinator: CalculatorCoordinator = CalculatorCoordinator(presenter: UINavigationController())
        let settingsCoordinator: SellTipsCoordinator = SellTipsCoordinator(presenter: UINavigationController())

        return [menuCoordinator, homeCoordinator, settingsCoordinator]
    }
}

extension TabBarCoordinator {
    func selectTab<T: Coordinator>(type _: T.Type) {
        guard let index = childCoordinators.firstIndex(where: { coordinator in
            coordinator is T
        }) else {
            return
        }

        tabBarController.selectedIndex = index
    }
}

