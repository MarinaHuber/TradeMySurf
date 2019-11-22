//
//  TutorialViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit
import Lottie

protocol WelcomeViewControllerDelegate: class {
	func performNextView()
}

class WelcomeViewController: UIViewController {
	weak var delegate: WelcomeViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
	@IBOutlet private(set) weak var lottieBoard: AnimationView! {
		didSet {
			lottieBoard.animation = Animation.named("clip-board")
			lottieBoard.animationSpeed = 0.9
			lottieBoard.contentMode = .scaleAspectFill
			lottieBoard.loopMode = .loop
			lottieBoard.play()
		}
	}
	@IBOutlet private(set) weak var lottieCalculate: AnimationView! {
		didSet {
			lottieCalculate.animation = Animation.named("shop")
			lottieCalculate.animationSpeed = 0.8
			lottieCalculate.contentMode = .scaleAspectFill
			lottieCalculate.loopMode = .loop
			lottieCalculate.play()
		}
	}
	@IBOutlet private(set) weak var lottieLocation: AnimationView! {
		didSet {
			lottieLocation.animation = Animation.named("air")
			lottieLocation.animationSpeed = 0.8
			lottieLocation.contentMode = .scaleAspectFill
			lottieLocation.loopMode = .loop
			lottieLocation.play()
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func openNext(_ sender: Any) {
		delegate?.performNextView()
	}
}

extension WelcomeViewController: StoryboardProtocol {}
