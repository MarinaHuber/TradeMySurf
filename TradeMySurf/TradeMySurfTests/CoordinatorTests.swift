//
//  CoordinatorTests.swift
//  TradeMySurfTests
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import XCTest
@testable import TradeMySurf

final class CoordinatorTests: XCTestCase {
	typealias CoordinatorType = LoadingStateCoordinator
	var coordinator: CoordinatorType!

	override func setUp() {
		coordinator = CoordinatorType(window: UIWindow())
	}

	override func tearDown() {
		super.tearDown()
		coordinator = nil
	}
	func testStart() {
	    coordinator.start()
		XCTAssertTrue(try XCTUnwrap(UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController) is UINavigationController)
		XCTAssertFalse(try XCTUnwrap(coordinator.presenter.viewControllers).isEmpty)
	}

	func testCoordinatorCreation() {
		XCTAssertTrue(coordinator.presenter.viewControllers.isEmpty)
		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}
}
