//
//  SavedEnum.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
enum SavedEnum {

    static var surfDate = SavedValue<Date>("date")
    static var surfLevel = SavedValue<String>("level")
}
