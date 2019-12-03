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

class WelcomeViewController: UIViewController, CAAnimationDelegate {
	weak var delegate: WelcomeViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
    @IBOutlet weak var item: UIStackView!
    private var firstTime: Bool?
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
			lottieCalculate.animation = Animation.named("ocean-wave")
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
			animate(item)
		}

		  func animate(_ item : UIStackView) {
			  let scale = CABasicAnimation(keyPath: "transform.scale")
			  scale.fromValue = 0.2
			  scale.toValue =  1
			  scale.duration = 1
			  scale.delegate = self
			  item.layer.add(scale, forKey: "scale")
			  let post = CABasicAnimation(keyPath: "position.y")
			  post.fromValue = 0
			  post.duration = 2
			  post.isRemovedOnCompletion =  false
			  post.fillMode = CAMediaTimingFillMode.forwards
			  item.layer.add(post, forKey: "post")
			  item.layer.position.y = self.view.center.y + 100
		  }

		  override func viewWillDisappear(_ animated: Bool) {
			  super.viewWillDisappear(animated)

		  }


	@IBAction func openNext(_ sender: Any) {
		delegate?.performNextView()
	}
}

extension WelcomeViewController: StoryboardProtocol {}
