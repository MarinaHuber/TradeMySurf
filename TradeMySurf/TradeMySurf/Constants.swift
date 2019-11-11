//
//  Constants.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/11/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

enum Constants {

	enum CoordinatorKeys: String {
		case welcomViewCoordinator
		case addLevelCoordinator
		case addDateCoordinator
		case tabBarCoordinator
	}

	enum Storyboards {
		static let addLevelViewController = "AddLevelViewController"
		static let addDateViewController = "AddDateViewController"
		static let priceCalculatorViewController = "PriceCalculatorViewController"
		static let buyTipsViewController = "BuyTipsViewController"
		static let savedTripsViewController = "SavedTripsViewController"

		enum StoryboardIdentifiers {
			static let addLevelViewController = "AddLevelViewController"
			static let addDateViewController = "AddDateViewController"
			static let priceCalculatorViewController = "PriceCalculatorViewController"
			static let buyTipsViewController = "BuyTipsViewController"
			static let savedTripsViewController = "SavedTripsViewController"
		}
	}
}
