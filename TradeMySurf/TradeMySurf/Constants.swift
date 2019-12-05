//
//  Constants.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/11/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

enum Constants {

	enum CoordinatorKeys: String {
		case loadViewController
		case welcomeViewCoordinator
		case addLevelCoordinator
		case addDateCoordinator
		case tabBarCoordinator
	}

	enum Storyboards {
		static let loadViewController = "LoadingStateViewController"
		static let welcomeViewCoordinator = "Welcome"
		static let addLevelViewController = "AddLevelViewController"
		static let addDateViewController = "AddDateViewController"
		static let priceCalculatorViewController = "PriceCalculatorViewController"
		static let surfTripViewController = "SurfTripViewController"
		static let savedTripsViewController = "SavedTripsViewController"
	}
}
