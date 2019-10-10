//
//  TabBarViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/6/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {

	let firstCoordinator = CalculatorCoordinator(presenter: UINavigationController())
	let secondCoordinator = BuyTipsCoordinator(presenter: UINavigationController())
	let thirdCoordinator = SellTipsCoordinator(presenter: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
	firstCoordinator.start()
	secondCoordinator.start()
	thirdCoordinator.start()

	viewControllers = [firstCoordinator.presenter, secondCoordinator.presenter, thirdCoordinator.presenter]
	}

}

extension TabBarViewController: StoryboardProtocol { }
