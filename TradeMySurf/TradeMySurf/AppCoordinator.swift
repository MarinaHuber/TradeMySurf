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

	internal var childCoordinators: [Coordinator]
	internal var presenter: UINavigationController
	let window: UIWindow
	let rootCoordinator: TutorialCoordinator

	init(window: UIWindow) {
		self.window = window
		childCoordinators = []
		presenter = UINavigationController()
		rootCoordinator = TutorialCoordinator(presenter: presenter)

		presenter.setNavigationBarHidden(true, animated: false)

	}

	func start() {
		//rootViewController is UINavigationController
		window.rootViewController = presenter
		rootCoordinator.start()
		window.makeKeyAndVisible()
	}
}

