//
//  SavedValue.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation


extension UserDefaults {
	var selectedLevel: String? {
		get {
			/// Read value from UserDefaults returns T
			return UserDefaults.standard.string(forKey: "selectedString")
		}
		set {
			/// Set value to UserDefaults
			UserDefaults.standard.set(newValue, forKey: "selectedString")
		}
	}

}

extension UserDefaults {
	var userWasHere: Bool {
		get {
			///// Register the app default:
			/// Initialize value from UserDefaults returns T
//			UserDefaults.standard.register(defaults: ["userWasHere" : false])
			return UserDefaults.standard.bool(forKey: "userWasHere")
		}
		set {
			/// Set value to UserDefaults
			UserDefaults.standard.set(newValue, forKey: "userWasHere")
		}
	}

}
extension UserDefaults {
var surfingTime: Date? {
	get {
		return UserDefaults.standard.object(forKey: "surfingTime") as? Date
	}
	set(newVal) {
		UserDefaults.standard.set(newVal, forKey: "surfingTime")
	}
}
}
