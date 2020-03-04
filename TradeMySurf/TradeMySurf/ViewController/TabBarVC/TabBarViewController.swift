//
//  TabBarViewController.swift
//  
//
//  Created by Marina Huber on 1/7/20.
//

import UIKit
final class TabBarViewController: UITabBarController {
    
    
    // MARK: Managing the TabBar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar() // Set tabBar before selected tab !!
        self.selectedIndex = 1

    }
    private func setUpTabBar() {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.guideViewController, bundle: nil)
        let saveVC: GuideViewController = GuideViewController.instantiate(from: storyboard)
        saveVC.title = "About surf"
        
        let storyboardSurf: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
        let recommendVC: SurfTripViewController = SurfTripViewController.instantiate(from: storyboardSurf)
        recommendVC.title = "Recommended"
        recommendVC.view.applyGradient(withColors: [.systemIndigo, .systemIndigo, .systemBlue, .systemTeal, .white], gradientOrientation: .vertical)
        
       let storyboardPrice: UIStoryboard = UIStoryboard(name: Constants.Storyboards.priceCalculatorViewController, bundle: nil)
        let priceVC: PriceCalculatorViewController = PriceCalculatorViewController.instantiate(from: storyboardPrice)
        priceVC.title = "Price compare"
        priceVC.view.applyGradient(withColors: [.systemIndigo, .systemIndigo, .systemTeal, .lightGray], gradientOrientation: .topLeftBottomRight)
        
        let controllers = [saveVC, recommendVC, priceVC]
        self.viewControllers = controllers.map { BaseNavigationController(rootViewController: $0)}
        
    }
}
