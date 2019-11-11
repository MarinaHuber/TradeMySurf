//
//  TutorialViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif

protocol WelcomeViewControllerDelegate: class {
	func performNextView()
}

class WelcomeViewController: UIViewController {
	weak var delegate: WelcomeViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func openNext(_ sender: Any) {
		delegate?.performNextView()
	}
}

extension WelcomeViewController: StoryboardProtocol {}
