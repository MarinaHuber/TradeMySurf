//
//  Coordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import UIKit

protocol Coordinator: AnyObject {
	var presenter: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
	func start()
}

extension Coordinator {
	func addChildCoordinator(coordinator: Coordinator) {
		childCoordinators.append(coordinator)
	}
}

extension Coordinator {

    func navigate(to viewController: UIViewController, with presentationStyle: NavigationStyle, animated: Bool = true) {
        switch presentationStyle {
        case .present:
            presenter.present(viewController, animated: animated, completion: nil)
        case .push:
            presenter.pushViewController(viewController, animated: true)
        }
    }
}

enum NavigationStyle {
    case present
    case push
}
