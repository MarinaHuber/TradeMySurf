//
//  LoadingStateCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SplashMainCoordinator: UIViewController {
    
    // MARK: - Inputs

    /// Window to manage
	private let window: UIWindow
    
    // MARK: - Initialization
	init(window: UIWindow) {
		self.window = window
        super.init(nibName: Constants.CoordinatorKeys.splashViewController.rawValue, bundle: nil)
	}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    }
    
    func showTabBarFlow() {

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
