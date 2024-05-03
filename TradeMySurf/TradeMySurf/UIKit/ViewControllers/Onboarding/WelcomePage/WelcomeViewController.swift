//
//  TutorialViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController, CAAnimationDelegate, StoryboardProtocol {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!    

    @IBOutlet weak var bgStackView: UIView!
    @IBOutlet var bgStackViewWidth: NSLayoutConstraint!
    @IBOutlet var firstText: UILabel!
    @IBOutlet var secondText: UILabel!
    @IBOutlet var thirdText: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UserDefaults.standard.userWasHere = false
        if UIDevice().userInterfaceIdiom == .pad {
            bgStackViewWidth.constant = 500
            firstText.font = UIFont(name: "AvenirNext-Regular", size: 19)
            secondText.font = UIFont(name: "AvenirNext-Regular", size: 19)
            thirdText.font = UIFont(name: "AvenirNext-Regular", size: 19)
            
        } else {
            bgStackViewWidth.constant = 300
        }
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
                case 1920, 2208, 2340:
                    post.toValue = view.bounds.size.height - 450
                case 2436, 2688, 1792:
                    post.toValue = view.bounds.size.height - 500

                default:
                    post.toValue = view.bounds.size.height - 500
            }
        } else {
             post.toValue = view.bounds.size.height - 500
        }
        post.duration = 1
        post.isRemovedOnCompletion =  false
        post.fillMode = CAMediaTimingFillMode.forwards
        item.layer.add(post, forKey: "post")
        item.layer.position.y = self.view.center.y
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    @IBAction func openNext(_ sender: UIButton) {
        scenePresenter?.presentAddLevel()
        UserDefaults.standard.userWasHere = true
    }
}
