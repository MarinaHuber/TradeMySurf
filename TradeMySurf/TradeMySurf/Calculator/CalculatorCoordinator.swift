//
//  CalculatorCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class CalculatorCoordinator: Coordinator {
var presenter: UINavigationController

func stop() {
}
var childCoordinators: [Coordinator]

init(presenter: UINavigationController) {
	self.presenter = presenter
	childCoordinators = []

	presenter.tabBarItem = UITabBarItem(title: "Menu", image: nil, selectedImage: nil)
}

func start() {
   }
}
