//
//  CoordinatorOnboarding.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class Coordinator: UIResponder, CoorinatorPresenting {

    
    
    // MARK: Creating the Scene Manager
    var presenter: UINavigationController
    var tabBarController: UITabBarController?
    
    let window: UIWindow
    
    
    init(window: UIWindow) {
        self.window = window
        self.presenter = UINavigationController()
        self.tabBarController = UITabBarController()
    }
    
    
    // MARK: Presenting Coordinators
    
    func presentTabBar() {
//        let controller: SplashViewController = SplashViewController.instantiate()
//        let navigationController = UINavigationController(rootViewController: controller)
//        window.rootViewController = navigationController
//        controller.delegate = self as SplashViewControllerDelegate
    
    }
    
    func presentSplash() {
        let controller: SplashViewController = SplashViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController
        controller.delegate = self as SplashViewControllerDelegate
        
    }
}

    // MARK: - SplashViewControllerDelegate
extension Coordinator: SplashViewControllerDelegate {
    
    func performScreenSwitch() {
           // presentSplash()
    }
}
