//
//  TabBarCoordinatorTests.swift
//  TradeMySurfTests
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import XCTest
@testable import TradeMySurf

class TabBarCoordinatorTests: XCTestCase {
	var sut: TabBarCoordinator!
	var navigationController: UINavigationController!
	var tabBarController: UITabBarController!

	override func setUp() {
		navigationController = UINavigationController()
		tabBarController = UITabBarController()
		sut = TabBarCoordinator(tabBarController: tabBarController, nav: navigationController)
	}

	func test_viewDidLoad_navigation_push_reviewsViewController() {
		sut.start()
		XCTAssertEqual(sut.tabBarController, tabBarController)
		XCTAssertTrue((sut.tabBarController?.isKind(of: TutorialViewController.self))!
		)
	}

}
