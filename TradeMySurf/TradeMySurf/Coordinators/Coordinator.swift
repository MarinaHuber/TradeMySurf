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

    
    
    // MARK: Creating the Coordinator
    
    let window: UIWindow
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: Presenting Coordinators
    
    func presentTabBar() {
        let viewController = TabBarViewController()
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        ///removes the double nav bar
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func presentSplash() {
        let controller: SplashViewController = SplashViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController        
    }
}
