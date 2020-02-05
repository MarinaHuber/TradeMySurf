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
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemIndigo
        navBarAppearance.shadowImage = nil // line
        navBarAppearance.shadowColor = nil
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.tintColor = .white
        navigationBar.backgroundColor = .systemIndigo

    }

}

