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
        delegate?.performScreenSwitch()
        //TO DO:
//            animateView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/2)
//            animateView2.frame = CGRect(x: 0, y: view.frame.size.height/2, width: view.frame.size.width, height: view.frame.size.height/2)
//            animateView.contentMode = .scaleAspectFit
//            animateView2.contentMode = .scaleAspectFit
//            view.addSubview(animateView)
//            view.addSubview(animateView2)
//            animateView.play()
//            animateView2.play()
//
//            UIView.animate(withDuration: 1, delay: 3.0, options: .curveEaseIn, animations: {
//                self.view.alpha = 0
//
//            }, completion: { _ in
//                self.switchScreen()
//            })

        
        
    }
}
extension LoadingStateViewController: StoryboardProtocol {}
