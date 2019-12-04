//
//  SavedEnum.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

// The UserDefaults wrapper
struct StorageData {
	@UserDefaultsHelper(key: "LEVEL_FEATURE_SURFBOARD", defaultValue: "")
	static var surfLevel: String

    @UserDefaultsHelper(key: "LOADINGSTATE_FEATURE", defaultValue: false)
	static var didUserSetUP: Bool

	@UserDefaultsHelper(key: "DATE_FEATURE_LOCATION", defaultValue: Date())
	static var surfDate: Date
}

extension StorageData {

	init(surfLevel: String, didUserSetUP: Bool, surfDate: Date) {
		StorageData.self.surfLevel = surfLevel
		StorageData.self.didUserSetUP = didUserSetUP
		StorageData.self.surfDate = surfDate
	}
}
