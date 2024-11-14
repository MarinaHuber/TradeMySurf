//
//  Enums.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/21/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum Level: String, CaseIterable {
    case beginner = "Get vitamin D and negative ions from waves"
    case beginnerIntermediate = "Improve cardiovascular health"
    case intermediate = "Reduce stress and anxiety"
    case advanced = "Become part of community"
    case areals = "Build core strenght"
    case longboarding = "Build confidence"
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
		 default: break
		 }
		 return 0
	 }
}

enum TripSection: CaseIterable {
    case tipBeginner, tipBeginnerInter, tipIntermediate, tipAdvanced, tipAreals, tipLongboard
	case surfboardsBeginner, surfboardsBeginnerInter, surfboardsIntermediate, surfboardsAdvanced, surfboardsAreals, surfboardsLongboard
	case surfCountrySummer, surfCountryAutumn, surfCountryWinter, surfCountrySpring
}

enum TripItem: Hashable {

    case tip(SurfTip, Level)
    case surfboard(Surfboard, Level)
    case surfCountry(Surfboard, Level)
}




