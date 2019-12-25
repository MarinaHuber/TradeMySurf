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
    var parentCoordinator: LoadingStateCoordinator?
    lazy var leftBtn: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
        button.sizeToFit()
        button.addTarget(self,
                         action: #selector(self.popToRoot(_:)),
                         for: .touchUpInside)
      return UIBarButtonItem(customView: button)
    }()

	init(window: UIWindow, tabBarController: UITabBarController) {
		self.tabBarController = tabBarController
		childCoordinators = []
		self.presenter = UINavigationController()

    }
	 func start() {
		performGetTabBar()
        self.presenter.delegate = self
	}
	private func performGetTabBar() {
		let coordinators: [Coordinator] = generateTabCoordinators()

		coordinators.forEach({ coordinator in
			coordinator.start()
			addChildCoordinator(coordinator)
		})

		let presenters: [UIViewController] = coordinators.map({ coordinator -> UIViewController in
			return coordinator.presenter
		})
        leftBtn.style = .plain
        tabBarController?.navigationItem.leftBarButtonItem = leftBtn
		tabBarController?.setViewControllers(presenters, animated: false)
		selectTab(type: SurfTripCoordinator.self)
	}

	private func generateTabCoordinators() -> [Coordinator] {
		let calculatorCoordinator: CalculatorCoordinator = CalculatorCoordinator(presenter: UINavigationController())
		let tripCoordinator: SurfTripCoordinator = SurfTripCoordinator(presenter: UINavigationController())
		let sellCoordinator: SavedTripsCoordinator = SavedTripsCoordinator(presenter: UINavigationController())
		return [calculatorCoordinator, tripCoordinator, sellCoordinator]
	}
    
    @objc func popToRoot(_ sender: UIBarButtonItem) {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.welcomeViewCoordinator, bundle: nil)
        let controller: WelcomeViewController = WelcomeViewController.instantiate(from: storyboard)
        tabBarController?.navigationController?.pushViewController(controller, animated: true)

    }
}

extension TabBarCoordinator: UINavigationControllerDelegate {

	func selectTab<T: Coordinator>(type _: T.Type) {
		guard let index = childCoordinators.firstIndex(where: { coordinator in
			coordinator is T
		}) else {
			return
		}
		tabBarController?.selectedIndex = index
}
    
    // MARK: - UINavigationControllerDelegate
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        // Read the view controller we’re moving from.
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//        if let recommendedViewController = fromViewController as? SurfTripViewController {
//            // We're popping a buy view controller; end its coordinator
//            //parentCoordinator!.childDidFinish(recommendedViewController.coordinator)
//        }
//    }
}
