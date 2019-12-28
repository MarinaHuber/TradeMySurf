//
//  OnboardingCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class WelcomeOnboardingCoordinator: RootViewCoordinator {
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
        showWelcomeScene()
	}
 
    private func showWelcomeScene() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.welcomeViewCoordinator, bundle: nil)
        let controller: WelcomeViewController = WelcomeViewController.instantiate(from: storyboard)
        controller.delegate = self
        presenter.show(controller, sender: nil)
    }
}
// MARK: Onboarding scene delegate
extension WelcomeOnboardingCoordinator: WelcomeViewControllerDelegate {
    
    func welcomeViewControllerTapGetStarted(viewController: WelcomeViewController) {
        showLevelScene()
    }
    private func showLevelScene() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addLevelViewController, bundle: nil)
        let viewController: AddLevelViewController = AddLevelViewController.instantiate(from: storyboard)
        viewController.delegate = self
        presenter.show(viewController, sender: nil)
    }
}
// MARK: Onboarding Level scene delegate
extension WelcomeOnboardingCoordinator : AddLevelViewControllerDelegate {
    
    func levelViewControllerTapAddDate(viewController: AddLevelViewController) {
        showDateScene()
    }
    
    private func showDateScene() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addDateViewController, bundle: nil)
        let dateController: AddDateViewController = AddDateViewController.instantiate(from: storyboard)
        dateController.delegate = self
        presenter.show(dateController, sender: nil)
        
    }
}
// MARK: Onboarding Date scene delegate
extension WelcomeOnboardingCoordinator: AddDateViewControllerDelegate {
    
    func viewControllerTapPerformTabBar(viewController: AddDateViewController) {
        showTabBar()
    }
    
    func showTabBar() {
        let coordinator: TabBarMainCoordinator = TabBarMainCoordinator(window: window, tabBarController: UITabBarController())
        coordinator.start()
        presenter.setNavigationBarHidden(true, animated: true)
        presenter.setViewControllers([coordinator.tabBarController!], animated:true)
    }
}
