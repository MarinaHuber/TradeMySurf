//
//  BuyTipsCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import SwiftUI

final class BuyTipsCoordinator: Coordinator {
	var coordinator: BuyTipsCoordinator?
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []

		presenter.tabBarItem = UITabBarItem(title: "RECOMMENDED", image: nil, selectedImage: nil)
	}

	func start() {
		let vc = UIHostingController(rootView: WelcomeSwiftUIView())
		let storyboard: UIStoryboard = UIStoryboard(name: "Buy", bundle: nil)
		let viewController: BuyTipsViewController = BuyTipsViewController.instantiate(from: storyboard)
		presenter.pushViewController(vc, animated: true)
	}
}
