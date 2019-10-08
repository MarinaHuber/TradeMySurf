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
	var navigationController: UINavigationController
    var childCoordinators: [Coordinator]

    init(nav: UINavigationController) {
		self.navigationController = nav
		childCoordinators = []

		navigationController.setNavigationBarHidden(true, animated: false)
    }

	func start() {

	}
}

//extension ViewController : StoryboardProtocol{
//    static func initialize(from storyboard: UIStoryboard) -> Self {
//        let viewController: Self = initialize(from: storyboard)
//        return viewController
//    }
//}
