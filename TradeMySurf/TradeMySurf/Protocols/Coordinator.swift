//
//  Coordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import UIKit

protocol Coordinator: AnyObject {
	var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
	func start()
}
extension Coordinator {
	func stop() {
		navigationController.setViewControllers([], animated: false)
	}
}

extension Coordinator {
	func addChildCoordinator(coordinator: Coordinator) {
		childCoordinators.append(coordinator)
	}
}
