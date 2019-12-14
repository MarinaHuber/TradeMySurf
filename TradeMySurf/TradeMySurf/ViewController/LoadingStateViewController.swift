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
        loadAnimateView.frame = CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: view.frame.size.height/2)
        loadAnimateView.contentMode = .scaleAspectFit
        view.addSubview(loadAnimateView)
        loadAnimateView.play()
        UIView.animate(withDuration: 0.5, delay: 0.4, options: .curveEaseIn, animations: {
            self.loadAnimateView.play()

        }, completion: { _ in
            DispatchQueue.main.async {
                self.delegate?.performScreenSwitch()
            }
        })
        
    }
}
extension LoadingStateViewController: StoryboardProtocol {}
