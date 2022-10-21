//
//  TabBarVC.swift
//  TradeMySurf
//
//  Created by Marina Huber on 3/5/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class TabBarVC: UIViewController, StoryboardProtocol {

    // MARK: - Outlets
    
    @IBOutlet var gradientView: GradientView!
    @IBOutlet weak var container: UIView!
    @IBOutlet private weak var tabbarBackgroundView: UIView!
    @IBOutlet private weak var spaceholderView: UIView!
    @IBOutlet private weak var tabbarStackView: UIStackView!

    // MARK: - Properties
    private var selectedEntry: TabbarEntry = .recommended
    private var viewControllers: [TabbarEntry: UINavigationController] = [:]

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabbar()
        self.swapViewController(for: .recommended)
    }

    // MARK: - Helper
    private func configureTabbar() {
        for entry in TabbarEntry.allCases {
            
            let itemView = TabItemView(frame: CGRect(x: 0.0, y: 0.0, width: self.tabbarBackgroundView.frame.size.width / 3, height: self.tabbarBackgroundView.frame.size.height))
            itemView.fill(with: entry)
            itemView.isSelected = self.selectedEntry == entry
            self.tabbarStackView.addArrangedSubview(itemView)
            
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapItem(_:)))
            itemView.addGestureRecognizer(recognizer)
        }
        
        self.tabbarStackView.clipsToBounds = false
        self.tabbarBackgroundView.clipsToBounds = false
        self.tabbarBackgroundView.bringSubviewToFront(self.tabbarStackView)
        
        self.gradientView.bringSubviewToFront(self.tabbarBackgroundView)

    }

    private func swapViewController(for entry: TabbarEntry) {

        if entry == self.selectedEntry && self.viewControllers[entry] != nil {

            return
        }

        // remove current ViewController
        if let previousViewController = self.viewControllers[self.selectedEntry] {

            previousViewController.willMove(toParent: nil)
            previousViewController.view.removeFromSuperview()
            previousViewController.removeFromParent()
        }

        // add new ViewController
        if let newViewController = self.viewControllers[entry] {
            
            self.configureChildViewController(for: newViewController, onView: self.container)

        } else {

            let vc = entry.viewController
            let navController = BaseNavigationController(rootViewController: vc)
            self.viewControllers[entry] = navController
            self.configureChildViewController(for: navController, onView: self.container)
            
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

            if let navController = self.viewControllers[entry],
                navController.viewControllers.count > 1 {

                navController.popToRootViewController(animated: true)
            }

        } else {

            self.swapViewController(for: entry)
        }
    }
}
