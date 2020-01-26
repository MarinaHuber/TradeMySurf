//
//  BaseNavigationController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 1/23/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
    lazy var statusBar = window?.windowScene?.statusBarManager?.statusBarFrame

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusView =  UIView()
        statusView.frame = statusBar!
        statusView.backgroundColor = .systemIndigo
        self.navigationBar.backgroundColor = .systemIndigo
        UIApplication.shared.delegate?.window??.addSubview(statusView)
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white as Any]

    }

}

