//
//  TutorialViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit




class TutorialViewController: UIViewController {

	weak var coordinator: TabBarCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func openTabBar(_ sender: Any) {
		coordinator?.performGetStarted()
	}
	
}

extension TutorialViewController: StoryboardProtocol {

}
