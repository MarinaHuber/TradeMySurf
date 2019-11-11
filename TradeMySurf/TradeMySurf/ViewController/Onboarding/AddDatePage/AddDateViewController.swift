//
//  AddDateViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif

protocol AddDateViewControllerDelegate: class {
	func performTabBar()
}

class AddDateViewController: UIViewController {
	weak var delegate: AddDateViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func openTabBar(_ sender: Any) {
		delegate?.performTabBar()
	}
}

extension AddDateViewController: StoryboardProtocol {}
