//
//  LoadingStateViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/4/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import Lottie

protocol LoadingViewControllerDelegate: class {
	func performScreenSwitch()
}

class LoadingStateViewController: UIViewController {
    weak var delegate: LoadingViewControllerDelegate?
	let loadAnimateView = AnimationView(name: "loader_animation")

    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimateView.frame = CGRect(x: 0, y: view.frame.size.height/4, width: view.frame.size.width, height: view.frame.size.height/1.5)
        loadAnimateView.contentMode = .scaleAspectFit
        view.addSubview(loadAnimateView)
        loadAnimateView.play()
        UIView.animate(withDuration: 2.5, delay: 1, options: .curveEaseIn, animations: {
            self.view.alpha = 0.3
            
        }, completion: { _ in
            self.delegate?.performScreenSwitch()
        })
    }
}
extension LoadingStateViewController: StoryboardProtocol {}
