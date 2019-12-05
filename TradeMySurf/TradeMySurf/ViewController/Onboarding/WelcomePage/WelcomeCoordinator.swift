//
//  OnboardingCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

 class WelcomeCoordinator: NSObject, Coordinator {

	internal var presenter: UINavigationController
	var childCoordinators: [Coordinator]

	init(window: UIWindow, presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []
		
	}
	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.welcomeViewCoordinator
			, bundle: nil)
		let controller: WelcomeViewController = WelcomeViewController.instantiate(from: storyboard)
		controller.delegate = self
		presenter.pushViewController(controller, animated: true)
	}
}

extension WelcomeCoordinator : WelcomeViewControllerDelegate {
	func performNextView() {

		let addLevelCoordinator: AddLevelViewCoordinator = AddLevelViewCoordinator(presenter: UINavigationController())
		addLevelCoordinator.start()
		addChildCoordinator(addLevelCoordinator)
		addLevelCoordinator.presenter.modalPresentationStyle = .fullScreen
		presenter.present(addLevelCoordinator.presenter, animated: true, completion: nil)
	}
}
