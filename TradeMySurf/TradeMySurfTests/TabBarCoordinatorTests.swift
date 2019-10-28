//
//  TabBarCoordinatorTests.swift
//  TradeMySurfTests
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import XCTest
@testable import TradeMySurf

final class TabBarCoordinatorTests: XCTestCase {
	typealias CoordinatorType = TabBarCoordinator
	var coordinator: CoordinatorType!
	var tabBarController: UITabBarController!

	override func setUp() {
		coordinator = CoordinatorType(tabBarController: UITabBarController(), nav:UINavigationController())
	}

	override func tearDown() {
		super.tearDown()
		coordinator = nil
	}
	func testCoordinatorCreation() {
		//XCTAssertTrue(coordinator.viewControllers.isEmpty)
		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testCoordinatorPushViewController() {
		coordinator.start()

		XCTAssertFalse(coordinator.tabBarController!.isKind(of: TutorialViewController.self))
	}

	func testCoordinatorPopViewController() {
		coordinator.start()
		XCTAssertEqual(coordinator.tabBarController!.viewControllers!.count, 3)
		coordinator.childCoordinators.popLast()

		waitForUIKitNavigationAnimation(completion: {
			XCTAssertEqual(self.coordinator.tabBarController!.viewControllers!.count, 3)
		//	XCTAssertTrue(self.coordinator.tabBarController!.viewControllers!.first is TutorialViewController)
		})
	}


	func testAddChildCoordinator() {
		let childCoordinator: CoordinatorType = CoordinatorType(tabBarController: UITabBarController(), nav: UINavigationController())
		coordinator.addChildCoordinator(coordinator: childCoordinator)
		XCTAssertFalse(coordinator.childCoordinators.isEmpty)
	}


}

extension XCTestCase {
    func waitForUIKitNavigationAnimation(completion: @escaping () -> Void) {
        let expectation: XCTestExpectation = XCTestExpectation(description: #function)
        let result: XCTWaiter.Result = XCTWaiter.wait(for: [expectation], timeout: 1.5)

        switch result {
        case .completed:
            break

        case .timedOut:
            completion()

        case .incorrectOrder:
            break

        case .invertedFulfillment:
            break

        case .interrupted:
            break
		@unknown default:
			break
		}
    }
}

