//
//  Coordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/7/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import UIKit

///AnyObject can be used for working with objects that derive from Class but that don’t share a common root Class

public protocol Coordinator: AnyObject {
    
    var presenter: UINavigationController { get set }
    /** Any child coordinators to keep track of, to prevent them from getting deallocated in memory. */
    var childCoordinators: [Coordinator] { get set }
    /** Used for handling startup tasks - think of it as the `viewDidLoad()` of coordinators. */
    func start()


}

public extension Coordinator {
    /// Add a child coordinator to the parent
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    /// Remove a child coordinator from the parent
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
    
}
