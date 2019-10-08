//
//  BuyTipsCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class BuyTipsCoordinator: Coordinator {
var navigationController: UINavigationController

func stop() {
}
var childCoordinators: [Coordinator]

init(navigationController: UINavigationController) {
	self.navigationController = navigationController
	childCoordinators = []

	navigationController.tabBarItem = UITabBarItem(title: "Menu", image: nil, selectedImage: nil)
}

func start() {
   }
}
