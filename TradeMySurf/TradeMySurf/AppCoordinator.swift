//
//  AppCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
	let window: UIWindow
	let presenter: UINavigationController
	let firstCoordinator: TutorialCoordinator

	init(window: UIWindow) {
	  self.window = window
	  childCoordinators = []
	  presenter = UINavigationController()
	  presenter.setNavigationBarHidden(true, animated: false)
	  presenter.navigationBar.prefersLargeTitles = true

	  firstCoordinator = TutorialCoordinator(presenter: presenter)
	}

	func start() {
	  window.rootViewController = presenter
	  firstCoordinator.start()
	  window.makeKeyAndVisible()
	}
}

