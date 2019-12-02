//
//  UserDefaults.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/21/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum Level: String, CaseIterable {
    case beginner = "Learning to stand up in white water waves"
    case beginnerIntemediate = "Paddling out, dropping straight down the face of the wave"
    case intermediate = "Trimming down the middle line of the wave"
    case advanced = "Performing full carving changes"
	case professional = "Professional level speed, power and flow maneuvers"

	 static func enumFromString(string: String) -> Level? {
		return self.allCases.first{ "\($0)" == string }
	}
}

enum Season: String, CaseIterable {
    case winter = "Winter"
    case spring = "Spring"
    case summer = "Summer"
    case autumn = "Autumn"
}
