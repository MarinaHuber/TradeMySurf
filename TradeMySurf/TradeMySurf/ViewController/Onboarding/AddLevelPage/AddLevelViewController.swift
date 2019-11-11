//
//  AddLevelViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

protocol AddLevelViewControllerDelegate: class {
	func performNext()
}

class AddLevelViewController: UIViewController {

		weak var delegate: AddLevelViewControllerDelegate?
		weak var coordinator: TabBarCoordinator?

		override func viewDidLoad() {
			super.viewDidLoad()
		}

		@IBAction func openAddDate(_ sender: Any) {
			delegate?.performNext()
		}
}
extension AddLevelViewController: StoryboardProtocol {}
