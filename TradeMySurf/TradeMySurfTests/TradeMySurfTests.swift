//
//  TradeMySurfTests.swift
//  TradeMySurfTests
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import XCTest
@testable import TradeMySurf

class TradeMySurfTests: XCTestCase {
	var viewController: TutorialViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController

    }
	func testViewControllerShouldHaveNavigationController() {
		let viewController = UIViewController()
		let navigation = UINavigationController()
		navigation.viewControllers = [viewController]
		XCTAssertNotNil(viewController.navigationController)
	}
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testTutorialViewExists() {
		 // given
		 let sut = TutorialViewController()

		 // when
		 sut.loadViewIfNeeded()

		 // then
		 XCTAssertNotNil(sut.view)
	 }

}
