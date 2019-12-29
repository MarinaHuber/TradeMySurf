//
//  CoordinatorOnboarding.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class CoordinatorTest: UIResponder, CoorinatorPresenting {
    
    // MARK: Creating the Scene Manager
    var presenter: UINavigationController
    var tabBarController: UITabBarController?
    var childCoordinators: [Coordinator]
    
    let window: UIWindow
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Presenting Coordinators
    func presentSplash() {
        
    }
    
    func presentOnboardingWelcome() {
        
    }
    
    func presentOnboardingLevel() {
        
    }
    
    func presentOnboardingDate() {
        
    }
    
    
}
