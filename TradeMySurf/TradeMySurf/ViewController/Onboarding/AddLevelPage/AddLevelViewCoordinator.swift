/**
/*  Copyright © Marina Huber. All rights reserved.*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/
//  AddLevelViewCoordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/11/19.
*/

import UIKit

final class AddLevelViewCoordinator: Coordinator {
	internal var presenter: UINavigationController

	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		self.childCoordinators = []
		self.presenter.navigationBar.barTintColor = .white
		self.presenter.navigationBar.tintColor = .black
		self.presenter.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
		self.presenter.navigationBar.shadowImage = UIImage()

	}
	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.addLevelViewController, bundle: nil)
		let viewController: AddLevelViewController = AddLevelViewController.instantiate(from: storyboard)
		viewController.delegate = self
		presenter.pushViewController(viewController, animated: true)
	}

}

extension AddLevelViewCoordinator : AddLevelViewControllerDelegate {
		func performAddDate() {
		let addDateCoordinator: AddDateCoordinator = AddDateCoordinator(presenter: UINavigationController())
		addDateCoordinator.start()
		addChildCoordinator(addDateCoordinator)
		addDateCoordinator.presenter.modalPresentationStyle = .fullScreen
		presenter.present(addDateCoordinator.presenter, animated: true, completion: nil)
	}

}
