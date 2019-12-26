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
	func performAddLevel()
}

class WelcomeViewController: UIViewController, CAAnimationDelegate {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!    
	weak var delegate: WelcomeViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
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
			lottieCalculate.animation = Animation.named("coin-wallet")
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
	@IBOutlet weak var bgStackView: UIView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        startButton.alpha = 0
        welcomeLabel.alpha = 0
        introLabel.alpha = 0
        UIView.animate(withDuration: 2.6, animations: {
            self.startButton.alpha = 1
            self.welcomeLabel.alpha = 1
            self.introLabel.alpha = 1
        }, completion: { _ in
        })
        animate(bgStackView)
    }

		  func animate(_ item : UIView) {
			  let scale = CABasicAnimation(keyPath: "transform.scale")
			scale.fromValue = 0.6
			  scale.toValue =  1
			  scale.duration = 1
			  scale.delegate = self
			  item.layer.add(scale, forKey: "scale")
			  let post = CABasicAnimation(keyPath: "position.y")
			  post.fromValue = view.frame.size.height + 20
            if UIDevice().userInterfaceIdiom == .phone {
                   switch UIScreen.main.nativeBounds.height {
                   case 1136:
                    post.toValue = view.bounds.size.height - 300
                   case 1334:
                    post.toValue = view.bounds.size.height - 400
                   case 1920, 2208:
                    post.toValue = view.bounds.size.height - 450
                   case 2436:
                    post.toValue = view.bounds.size.height - 500
                   case 2688:
                    post.toValue = view.bounds.size.height - 500
                   case 1792:
                    post.toValue = view.bounds.size.height - 500
                   default:
                    post.toValue = view.bounds.size.height - 500
                   }
               }
			  post.duration = 2
			  post.isRemovedOnCompletion =  false
			  post.fillMode = CAMediaTimingFillMode.forwards
			  item.layer.add(post, forKey: "post")
			  item.layer.position.y = self.view.center.y
		  }

		  override func viewWillDisappear(_ animated: Bool) {
			  super.viewWillDisappear(animated)

		  }

	@IBAction func openNext(_ sender: Any) {
		delegate?.performAddLevel()
	}
}

extension WelcomeViewController: StoryboardProtocol {}
