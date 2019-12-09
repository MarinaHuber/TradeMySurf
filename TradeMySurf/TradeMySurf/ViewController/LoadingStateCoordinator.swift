//
//  LoadingStateCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class LoadingStateCoordinator: NSObject, Coordinator {
	internal var childCoordinators: [Coordinator]
	internal var presenter: UINavigationController
	let window: UIWindow
	private var userSettup = UserDefaults.standard.didUserSetUp

	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
		presenter = UINavigationController()
		self.presenter.navigationBar.backgroundColor = .clear
		self.presenter.navigationBar.barTintColor = .clear
		self.presenter.navigationBar.tintColor = .black
		self.presenter.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
		self.presenter.navigationBar.shadowImage = UIImage()
		self.presenter.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
		presenter.setNavigationBarHidden(true, animated: false)
	}

	 func start() {
		let controller: LoadingStateViewController = LoadingStateViewController.instantiate()
		window.rootViewController = controller
		controller.delegate = self
		}
}

extension LoadingStateCoordinator : LoadingViewControllerDelegate {
	func performScreenSwitch() {
		 userSettup = false

		if userSettup {
			let mainTabCoordinator = TabBarCoordinator(window: window, tabBarController: UITabBarController())
			childCoordinators.append(mainTabCoordinator)
			window.rootViewController = mainTabCoordinator.tabBarController
			mainTabCoordinator.presenter.modalPresentationStyle = .fullScreen
			mainTabCoordinator.start()

		} else {
			let welcomeCoordinator = WelcomeCoordinator(window: window, presenter: presenter)
			childCoordinators.append(welcomeCoordinator)
			window.rootViewController = welcomeCoordinator.presenter
			welcomeCoordinator.start()
		}
	}
}
