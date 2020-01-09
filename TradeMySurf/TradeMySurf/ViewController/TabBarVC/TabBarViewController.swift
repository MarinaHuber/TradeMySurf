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
        let storyboard: UIStoryboard = UIStoryboard(name: "SavedTripsViewController", bundle: nil)
        let saveVC: SavedTripsViewController = SavedTripsViewController.instantiate(from: storyboard)
        saveVC.title = "Saved"
        let storyboardSurf: UIStoryboard = UIStoryboard(name: "SurfTripViewController", bundle: nil)
        let recommendVC: SurfTripViewController = SurfTripViewController.instantiate(from: storyboardSurf)
        recommendVC.title = "Recommend"
        recommendVC.view.backgroundColor = .blue
        let storyboardPrice: UIStoryboard = UIStoryboard(name: "PriceCalculatorViewController", bundle: nil)
        let priceVC: PriceCalculatorViewController = PriceCalculatorViewController.instantiate(from: storyboardPrice)
        priceVC.title = "Calculator"
        priceVC.view.backgroundColor = .cyan
        let controllers = [saveVC, recommendVC, priceVC]
        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0)}
        
    }
}