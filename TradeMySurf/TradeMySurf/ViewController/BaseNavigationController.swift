//
//  BaseNavigationController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 1/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barTintColor = .clear
        self.navigationBar.tintColor = .black
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black as Any]

    }
}

