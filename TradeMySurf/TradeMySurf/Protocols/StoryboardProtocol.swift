//
//  StoryboardProtocol.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

// Inspired from Coordinator-Example by G. Lombardo & Hacking with swift
// https://www.hackingwithswift.com/articles/175/advanced-coordinator-pattern-tutorial-ios
// https://github.com/giulio92/Coordinator
// *******************************************************************************************

protocol StoryboardProtocol: AnyObject {
	static func initialize(from storyboard: UIStoryboard) -> Self
	static func instantiate() -> Self
}

extension StoryboardProtocol where Self: UIViewController {
	static func initialize(from storyboard: UIStoryboard) -> Self {
		let nameSpaceClassName: String = NSStringFromClass(self)

		guard let className: String = nameSpaceClassName.components(separatedBy: ".").last else {
			fatalError("Cannot find class name from: " + nameSpaceClassName)
		}

		guard let viewController: Self = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
			fatalError("Cannot find UIViewController with identifier: " + className)
		}

		return viewController
	}

	static func instantiate() -> Self {
		let storyboardIdentifier = String(describing: self)
		let storyboard = UIStoryboard(name: "Tutorial", bundle: Bundle.main)
		return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
	}
}
