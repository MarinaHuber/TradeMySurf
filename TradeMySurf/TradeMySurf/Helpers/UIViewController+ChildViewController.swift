//
//  UIViewController+ChildViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 3/4/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

extension UIViewController {

    /// needs UIView+Constraints.swift Extension
    func configureChildViewController(for childViewController: UIViewController, onView: UIView?) {

        let containerView: UIView = onView ?? self.view

        childViewController.view.bounds = containerView.bounds
        self.addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.positionEqualSuperview()
        containerView.layoutIfNeeded()
        childViewController.didMove(toParent: self)
    }
}
