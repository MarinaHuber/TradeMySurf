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
	@SavedValue(key: "LEVEL_FEATURE_SURFBOARD", defaultValue: "")
	static var surfLevel: String

	@SavedValue(key: "DATE_FEATURE_LOCATION", defaultValue: Date())
	static var surfDate: Date

	@SavedValue(key: "BOARD_FEATURE_SIZE", defaultValue: 199)
	static var surfBoarUnitSize: Int
}
