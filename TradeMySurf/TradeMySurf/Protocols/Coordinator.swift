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
}

extension Coordinator {
    /**
     Adds a child coordinator to the parent, preventing it from getting deallocated in memory.

     - Parameter childCoordinator: The coordinator to keep allocated in memory.
     */
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    /**
     Removes a child coordinator from its parent, releasing it from memory.

     - Parameter childCoordinator: The coordinator to release.
     */

    func removeChildCoordinator(_ coordinator: Coordinator) {
		if let idx = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: idx)
        }
	}
}
