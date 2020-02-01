//
//  UserDefaults.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/21/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum Level: String, CaseIterable {
    case Beginner = "Learning to stand up in white water waves"
    case BeginnerIntemediate = "Paddling out, dropping straight down the face of the wave"
    case Intermediate = "Trimming down the middle line of the wave"
    case Advanced = "Performing full carving changes"
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
	case tipBeginner, tipBeginnerInter, tipIntermediate, tipAdvanced
	case surfboardsBeginner, surfboardsBeginnerInter, surfboardsIntermediate, surfboardsAdvanced
	case surfCountrySummer, surfCountryAutumn, surfCountryWinter, surfCountrySpring
}

enum TripItem: Hashable {

	case tipBeginner(SurfTip), tipBeginnerInter(SurfTip), tipIntermediate(SurfTip), tipAdvanced(SurfTip)

	case surfboardsBeginner(Surfboard), surfboardsBeginnerInter(Surfboard), surfboardsIntermediate(Surfboard), surfboardsAdvanced(Surfboard)

    case surfCountrySummer(Location), surfCountryAutumn(Location), surfCountryWinter(Location), surfCountrySpring(Location)
}




