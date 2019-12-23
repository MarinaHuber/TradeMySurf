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

	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
		presenter = UINavigationController()
        //TODO: makes navigation bar transparent extract in func
		self.presenter.navigationBar.barTintColor = .clear
		self.presenter.navigationBar.tintColor = .black
		self.presenter.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
		self.presenter.navigationBar.shadowImage = UIImage()
		self.presenter.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
	}

	 func start() {
		let controller: LoadingStateViewController = LoadingStateViewController.instantiate()
		window.rootViewController = controller
		controller.delegate = self
		}
}
extension LoadingStateCoordinator : LoadingViewControllerDelegate {
    func performScreenSwitch() {
        if UserDefaults.standard.userWasHere == true {
            let tabCoordinator: TabBarCoordinator = TabBarCoordinator(window: window, tabBarController: UITabBarController())
            //addChildCoordinator(tabCoordinator)
            window.rootViewController = tabCoordinator.tabBarController
            tabCoordinator.start()

        } else {
            let welcomeCoordinator = WelcomeCoordinator(window: window, presenter: presenter)
            addChildCoordinator(welcomeCoordinator)
            window.rootViewController = welcomeCoordinator.presenter
            welcomeCoordinator.start()
        }
    }
}
