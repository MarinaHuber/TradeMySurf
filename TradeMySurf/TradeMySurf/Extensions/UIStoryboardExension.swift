//
//  UIStoryboardExension.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    case onboarding = "Onboarding"
    case buy = "Buy"
    case sell = "Sell"
    case priceCalculator = "Calculator"
}

extension UIStoryboard {

	convenience init(name: StoryboardName) {
		self.init(name: name.rawValue, bundle: nil)
	}

    class func instantiateInitialViewController(inStoryboardwithName name: StoryboardName) -> UIViewController? {
        let storyboard = UIStoryboard(name: name)
        return storyboard.instantiateInitialViewController()
    }

    class func instantiateViewController(withIdentifier identifier: String, inStoryboardWithName name: StoryboardName) -> UIViewController? {
        let storyboard = UIStoryboard(name: name)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
