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

	internal var presenter: UINavigationController
	//create a next VC
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
		//tabBarController?.delegate = self as! UITabBarControllerDelegate

    }

    private func generateTabCoordinators() -> [Coordinator] {
        let menuCoordinator: BuyTipsCoordinator = BuyTipsCoordinator(presenter: UINavigationController())
        let homeCoordinator: CalculatorCoordinator = CalculatorCoordinator(presenter: UINavigationController())
        let settingsCoordinator: SellTipsCoordinator = SellTipsCoordinator(presenter: UINavigationController())

        return [menuCoordinator, homeCoordinator, settingsCoordinator]
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
		//let tabVC = TabBarViewController.instantiate()
		tabBarController?.setViewControllers(presenters, animated: false)
//		tabBarController = tabVC
//		presenter.pushViewController(tabVC, animated: true)

		//selectTab(.buy)
    }
}

//extension TabBarCoordinator {
//		private func selectTab(_ tab: Tab) {
//
//			if let vc = tabBarController as? TabBarViewController {
//				vc.selectedIndex = tab.rawValue
//			}
//
//			if let coordinator = childCoordinators[tab.rawValue] as? TabBarCoordinator {
//				coordinator.start()
//
//			}
//		}
//	}

extension TabBarCoordinator {
    var selectedViewController: UIViewController? {
		return tabBarController?.viewControllers?[tabBarController?.selectedIndex ?? 0]
    }
}


//extension TabBarCoordinator {
//    func selectTab<: Coordinator>() {
//        guard let index = childCoordinators.firstIndex(where: { coordinator in
//            coordinator is T
//        }) else {
//            return
//        }
//
//        tabBarController.selectedIndex = index
//    }
//}
