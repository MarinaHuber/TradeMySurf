//
//  TabBarCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit


final class TabBarMainCoordinator: NSObject, Coordinator {
	 var presenter: UINavigationController
	 var tabBarController: UITabBarController?
	 var childCoordinators: [Coordinator]
     private let window: UIWindow

	init(window: UIWindow, tabBarController: UITabBarController) {
        self.window = window
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
            //start() is from Coordinator protocol
			coordinator.start()
			addChildCoordinator(coordinator)
		})

		let presenters: [UIViewController] = coordinators.map({ coordinator -> UIViewController in
            //presenter is from Coordinator protocol
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
    deinit {
        
        self.childCoordinators.removeAll()
     //   assertionFailure("removing tabbar complete")
    }

}

extension TabBarMainCoordinator: UINavigationControllerDelegate {

	func selectTab<T: Coordinator>(type _: T.Type) {
		guard let index = childCoordinators.firstIndex(where: { coordinator in
			coordinator is T
		}) else {
			return
		}
		tabBarController?.selectedIndex = index
 }

}

extension TabBarMainCoordinator: SurfViewControllerDelegate {
    
    func performBackToRoot() {
        let welcomeCoordinator = WelcomeOnboardingCoordinator(window: window)
        addChildCoordinator(welcomeCoordinator)
        welcomeCoordinator.start()
        window.rootViewController = welcomeCoordinator.presenter
    }
    
    public func clearCoordinatorTabBar() {
        removeChildCoordinator(self)
    }
}
