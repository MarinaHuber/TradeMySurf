//
//  CoordinatorOnboarding.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit
import Presentr

final class Coordinator: UIResponder, CoorinatorPresenting {

    
    
    // MARK: Creating the Coordinator
    
    let window: UIWindow
    
    
    init(window: UIWindow) {
        self.window = window
    }
    let presenter: Presentr = {

       let bounds = UIScreen.main.bounds
       let height = ModalSize.fluid(percentage: 0.45)
       let width = ModalSize.fluid(percentage: 0.90)
       let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: bounds.minX + 20, y: bounds.minY + 200))
       let customType = PresentationType.custom(width: width, height: height, center: center)
       let customPresenter = Presentr(presentationType: customType)
          customPresenter.transitionType = .coverVerticalFromTop
          customPresenter.dismissTransitionType = .coverVerticalFromTop
          customPresenter.backgroundColor = .lightGray
          customPresenter.roundCorners = true
          customPresenter.cornerRadius = 13
          customPresenter.backgroundOpacity = 0.4
          customPresenter.dismissOnSwipe = true
          customPresenter.dismissOnSwipeDirection = .top
          return customPresenter
      }()
    
    
    // MARK: Presenting Coordinators
    
    func presentSplash() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.splashViewController, bundle: nil)
        let controller: SplashViewController = SplashViewController.instantiate(from: storyboard)
        let navigationController = UINavigationController(rootViewController: controller)
        window.rootViewController = navigationController        
    }
    
    func presentWelcome() {
        let welcomeStoryboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.welcomeViewController, bundle: nil)
        let welcomeController: WelcomeViewController = WelcomeViewController.instantiate(from: welcomeStoryboard)
        let navigationWelcome = UINavigationController(rootViewController: welcomeController)
        navigationWelcome.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigationWelcome
    }
    
    func presentAddLevel() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addLevelViewController, bundle: nil)
        let controller: AddLevelViewController = AddLevelViewController.instantiate(from: storyboard)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigationController
    }
    
    func presentAddDate() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addDateViewController, bundle: nil)
        let controller: AddDateViewController = AddDateViewController.instantiate(from: storyboard)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: true)
        window.rootViewController = navigationController
    }
    
    func presentTabBar() {
        let viewController = TabBarViewController()
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        ///removes the double nav bar
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.pushViewController(viewController, animated: true)
        
    }
    
    func presentAlert() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.alertVC, bundle: nil)
        let controller: AlertVC = AlertVC.instantiate(from: storyboard)
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        navigationController.setNavigationBarHidden(true, animated: true)
        navigationController.customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
    }
    
}
