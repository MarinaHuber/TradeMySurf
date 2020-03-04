//
//  TabBarViewController.swift
//  
//
//  Created by Marina Huber on 1/7/20.
//

import UIKit
final class TabBarViewController: UITabBarController {
    
    // MARK: - Outlets
      @IBOutlet private weak var containerView: UIView!
      @IBOutlet private weak var tabbarBackgroundView: UIView!
      @IBOutlet private weak var spaceholderView: UIView!
      @IBOutlet private weak var tabbarStackView: UIStackView!

      // MARK: - Properties
      private var selectedEntry: TabbarEntry = .recommended
      var tabControllers: [TabbarEntry: UINavigationController] = [:]
    
    // MARK: Managing the TabBar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar() // Set tabBar before selected tab !!
        self.selectedIndex = 1
//        self.tabbarBackgroundView.backgroundColor = .systemGray
//        self.spaceholderView.backgroundColor = .black

        self.configureTabbar()
        self.swapViewController(for: .recommended)

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

      // MARK: - Helper
      private func configureTabbar() {

          for entry in TabbarEntry.allCases {

              let itemView = TabItemView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width / 3, height: self.tabbarBackgroundView.frame.size.height))
              itemView.configure(with: entry)
              itemView.isSelected = self.selectedEntry == entry
              self.tabbarStackView.addArrangedSubview(itemView)

              let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapItem(_:)))
              itemView.addGestureRecognizer(recognizer)
          }
      }

      private func swapViewController(for entry: TabbarEntry) {

          if entry == self.selectedEntry && self.tabControllers[entry] != nil {

              return
          }

          // remove current ViewController
          if let previousViewController = self.tabControllers[self.selectedEntry] {

              previousViewController.willMove(toParent: nil)
              previousViewController.view.removeFromSuperview()
              previousViewController.removeFromParent()
          }

          // add new ViewController
          if let newViewController = self.tabControllers[entry] {

              self.configureChildViewController(for: newViewController, onView: self.containerView)

          } else {

              let vc = entry.viewController
              let navController = BaseNavigationController(rootViewController: vc)
              self.tabControllers[entry] = navController
              self.configureChildViewController(for: navController, onView: self.containerView)
          }

          // switch item selection
          if let previousTabView = self.tabbarStackView.arrangedSubviews.item(at: self.selectedEntry.rawValue) as? TabItemView,
              let newTabView = self.tabbarStackView.arrangedSubviews.item(at: entry.rawValue) as? TabItemView {

              UIView.animate(withDuration: 0.3) {

                  previousTabView.isSelected = false
                  newTabView.isSelected = true
              }

              self.selectedEntry = entry
          }
      }

      // MARK: - Selectors
      @objc private func tapItem(_ sender: UITapGestureRecognizer) {

          guard let tabView = sender.view as? TabItemView,
              let entry = TabbarEntry(rawValue: tabView.tag) else {

              return
          }

          if entry == self.selectedEntry {

              if let navController = self.tabControllers[entry],
                  navController.viewControllers.count > 1 {

                  navController.popToRootViewController(animated: true)
              }

          } else {

              self.swapViewController(for: entry)
          }
      }
}
