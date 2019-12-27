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
	var presenter: UINavigationController
	var childCoordinators: [Coordinator]
    var viewController: UIViewController?

    init(window: UIWindow, presenter: UINavigationController, viewController : UIViewController) {
		self.presenter = presenter
        self.viewController = viewController
		childCoordinators = []		
	}
	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.welcomeViewCoordinator, bundle: nil)
		let controller: WelcomeViewController = WelcomeViewController.instantiate(from: storyboard)
		controller.delegate = self
		presenter.pushViewController(controller, animated: true)
	}
}

extension WelcomeCoordinator : WelcomeViewControllerDelegate {

	func performAddLevel() {
		let addLevelCoordinator: AddLevelViewCoordinator = AddLevelViewCoordinator(presenter: UINavigationController())
		addLevelCoordinator.start()
        // adds the next coordinator ??
		addChildCoordinator(addLevelCoordinator)
		addLevelCoordinator.presenter.modalPresentationStyle = .fullScreen
		presenter.present(addLevelCoordinator.presenter, animated: true, completion: nil)
	}
}
