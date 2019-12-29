//
//  LoadingStateCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SplashMainCoordinator: RootViewCoordinator {
    
    
    // MARK: - Inputs
    var rootViewController: UIViewController {
        return self.presenter
    }
    var childCoordinators: [Coordinator]

    lazy var presenter: UINavigationController = {
         let presenter = UINavigationController()
         presenter.isNavigationBarHidden = true
         return presenter
     }()
    /// Window to manage
	private let window: UIWindow
    
    // MARK: - Initialization
	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
	}

    // MARK: - Coordinator
	public func start() {
		showSplashViewControler()
    }
    
    private func showSplashViewControler () {
       let controller: SplashViewController = SplashViewController.instantiate()
        window.rootViewController = controller
        controller.delegate = self
    }
    
    func showWelcomeFlow() {
        let welcomeCoordinator = WelcomeOnboardingCoordinator(window: window)
        addChildCoordinator(welcomeCoordinator)
        welcomeCoordinator.start()
        window.rootViewController = welcomeCoordinator.presenter
    }
    
    func showTabBarFlow() {
        let tabCoordinator: TabBarMainCoordinator = TabBarMainCoordinator(window: window, tabBarController: UITabBarController())
        window.rootViewController = presenter
        presenter.setNavigationBarHidden(true, animated: true)
        addChildCoordinator(tabCoordinator)
        tabCoordinator.start()
        presenter.setViewControllers([tabCoordinator.tabBarController!], animated: true)
    }
}
    // MARK: - SplashViewControllerDelegate
extension SplashMainCoordinator : SplashViewControllerDelegate {
    
    func performScreenSwitch() {
        if UserDefaults.standard.userWasHere == false {
            //showWelcomeFlow()
            showTabBarFlow()
        } else {
            showTabBarFlow()
           // showWelcomeFlow()
        }
    }
}
