//
//  LoadingStateCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class LoadingStateCoordinator: NSObject, Coordinator {
    // MARK: - Inputs
    var childCoordinators: [Coordinator]
    var presenter: UINavigationController
	private let window: UIWindow
    // MARK: - Initialization
	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
		presenter = UINavigationController()
      // TODO: makes navigation bar transparent extract in func
		self.presenter.navigationBar.barTintColor = .clear
		self.presenter.navigationBar.tintColor = .black
		self.presenter.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
		self.presenter.navigationBar.shadowImage = UIImage()
		self.presenter.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]
	}
    // MARK: - Coordinator
	 func start() {
		let controller: LoadingStateViewController = LoadingStateViewController.instantiate()
		window.rootViewController = controller
		controller.delegate = self
		}


}
    // MARK: - LoadingViewControllerDelegate
extension LoadingStateCoordinator : LoadingViewControllerDelegate {
    func performScreenSwitch() {
        if UserDefaults.standard.userWasHere == false {
            let tabCoordinator: TabBarCoordinator = TabBarCoordinator(window: window, tabBarController: UITabBarController())
            window.rootViewController = presenter
            presenter.setNavigationBarHidden(true, animated: true)
            addChildCoordinator(tabCoordinator)
            tabCoordinator.start()
            presenter.setViewControllers([tabCoordinator.tabBarController!], animated: true)

        } else {
            let welcomeCoordinator = WelcomeCoordinator(window: window, presenter: presenter)
            window.rootViewController = welcomeCoordinator.presenter
            addChildCoordinator(welcomeCoordinator)
            welcomeCoordinator.start()
        }
    }
}
