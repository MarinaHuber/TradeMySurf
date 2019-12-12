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
	let animateView2 = AnimationView(name: "loader_animation")

    override func viewDidLoad() {
        super.viewDidLoad()
        animateView2.frame = CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: view.frame.size.height/2)
        animateView2.contentMode = .scaleAspectFit
        view.addSubview(animateView2)
        animateView2.play()
        
        UIView.animate(withDuration: 1.0, delay: 1.0, options: .curveEaseIn, animations: {
            self.view.alpha = 0
            
        }, completion: { _ in
            DispatchQueue.main.async {
                self.delegate?.performScreenSwitch()
            }
        })
        
    }
}
extension LoadingStateViewController: StoryboardProtocol {}
