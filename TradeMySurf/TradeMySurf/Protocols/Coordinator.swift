//
//  Coordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import UIKit

///AnyObject can be used for working with objects that derive from Class but that don’t share a common root Class

protocol Coordinator: AnyObject {
	var presenter: UINavigationController { get }
    /** Any child coordinators to keep track of, to prevent them from getting deallocated in memory. */
    var childCoordinators: [Coordinator] { get set }
    /** Used for handling startup tasks - think of it as the `viewDidLoad()` of coordinators. */
    func start()
    func addChildCoordinator(_ coordinator: Coordinator)
    func removeChildCoordinator(_ coordinator: Coordinator)
    func popViewController(animated: Bool)
    func dismissViewController(animated: Bool, completion: (() -> Void)?)
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else { return }
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    func popViewController(animated: Bool) {
        presenter.popViewController(animated: animated)
    }
    func dismissViewController(animated: Bool, completion: (() -> Void)?) {
        presenter.dismiss(animated: animated, completion: completion)
 }
}
