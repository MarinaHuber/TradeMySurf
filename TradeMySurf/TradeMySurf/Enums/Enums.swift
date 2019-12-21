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
		return self.allCases.first { "\($0.rawValue)" == string }
	}
}

enum Season: Int, CaseIterable {
    case winter = 0
    case spring = 1
    case summer = 2
    case autumn = 3

	static func sortBy(month: Int) -> Int {
		 switch month {
		 case 0...2:
			 return Season.winter.rawValue
		 case 3...5:
			 return Season.spring.rawValue
		 case 6...9:
			 return Season.summer.rawValue
		 case 10...12:
			 return Season.autumn.rawValue
		 default:
		 }
		 return 0
	 }
}

enum TripSection: CaseIterable {
	case tips
	case surfboardsBeginner, surfboardsBeginnerInter, surfboardsIntermediate, surfboardsAdvanced, surfboardsPro
	case surfCountrySummer, surfCountryAutumn, surfCountryWinter, surfCountrySpring
}

enum TripItem: Hashable {
	case tip(SurfTip)
	case surfboardsBeginner(Surfboard), surfboardsBeginnerInter(Surfboard), surfboardsIntermediate(Surfboard), surfboardsAdvanced(Surfboard), surfboardsPro(Surfboard)
	case surfCountrySummer(Location),surfCountryAutumn(Location),surfCountryWinter(Location),surfCountrySpring(Location)
}
