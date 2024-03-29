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
        var heightFloat = Float()
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
                case 1334:
                    heightFloat = 0.60
                case 1920, 2208:
                    heightFloat = 0.55
                case 2436:
                    heightFloat = 0.50
                case 2688:
                    heightFloat = 0.45
                case 1792:
                    heightFloat = 0.50
                default:
                    heightFloat = 0.50
            }
        }
        let height = ModalSize.fluid(percentage: heightFloat)
        let width = ModalSize.fluid(percentage: 0.90)
        let center = ModalCenterPosition.customOrigin(origin: CGPoint(x: bounds.minX + 20, y: bounds.minY + 200))
        let customType = PresentationType.custom(width: width, height: height, center: center)
        let customPresenter = Presentr(presentationType: customType)
        customPresenter.transitionType = .coverVertical
        customPresenter.dismissTransitionType = .coverVertical
        customPresenter.backgroundColor = .black
        customPresenter.backgroundOpacity = 0.7
        customPresenter.roundCorners = true
        customPresenter.cornerRadius = 13
        customPresenter.dismissOnSwipe = false
        customPresenter.backgroundTap = .noAction
        customPresenter.outsideContextTap = .noAction
        return customPresenter
    }()
    
    
    // MARK: Presenting Coordinators
    
    func presentSplash() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.splashViewController, bundle: nil)
        let controller: SplashViewController = SplashViewController.instantiate(from: storyboard)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: true)
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
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
    }
    
    func presentAddDate() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addDateViewController, bundle: nil)
        let controller: AddDateViewController = AddDateViewController.instantiate(from: storyboard)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
    }
    
    func presentTabBar() {
        
        ///removes the double nav bar
        let storyboard: UIStoryboard = UIStoryboard(name: "TabBarVC", bundle: nil)
        let controller: TabBarVC = TabBarVC.instantiate(from: storyboard)
        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.setNavigationBarHidden(true, animated: false)
        window.rootViewController = navigationController
    }
    
    func presentDetailBoard(_ data: Surfboard) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.detailViewController, bundle: nil)
        let controller: DetailViewController = DetailViewController.instantiate(from: storyboard)
        controller.surfBoardData = data
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        navigationController.present(controller, animated: true, completion: nil)
    }
    
    func presentDetailLocation(_ data: Surfboard) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.locationViewController, bundle: nil)
        let controller: LocationViewController = LocationViewController.instantiate(from: storyboard)
        guard let navigationController = window.rootViewController as? UINavigationController else { fatalError() }
        navigationController.present(controller, animated: true, completion: nil)
    }
    
}
