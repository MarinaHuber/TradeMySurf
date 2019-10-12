//
//  OnboardingCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class TutorialCoordinator: Coordinator {

	var tabBar : TabBarCoordinator?
	var tabBarController: UITabBarController?

	internal var presenter: UINavigationController

	var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []
	}
	func start() {
		let tutorialVC = TutorialViewController.instantiate()
		tutorialVC.delegate = self
		presenter.pushViewController(tutorialVC, animated: true)
	}
}

extension TutorialCoordinator : TutorialViewControllerDelegate {
	func performTabBar() {

		let coordinator: TabBarCoordinator = TabBarCoordinator(tabBarController: UITabBarController(), nav: UINavigationController())
        addChildCoordinator(coordinator: coordinator)

        coordinator.start()

		presenter.present(coordinator.tabBarController!, animated: true, completion: nil)
		self.tabBar = coordinator
		
	}


}
