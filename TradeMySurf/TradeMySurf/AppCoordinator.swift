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
	let rootCoordinator: TutorialCoordinator

	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
		presenter = UINavigationController()
		rootCoordinator = TutorialCoordinator(presenter: presenter)

		//presenter.setNavigationBarHidden(true, animated: false)

	}

	func start() {
		window.rootViewController = presenter
		rootCoordinator.start()
		window.makeKeyAndVisible()
	}
}

