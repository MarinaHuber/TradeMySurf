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


}

extension TutorialViewController: StoryboardProtocol {
	func present() {
		let vc = TutorialViewController.instantiateViewController()
	}

}
