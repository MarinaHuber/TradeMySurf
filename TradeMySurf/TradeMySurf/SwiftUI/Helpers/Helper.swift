//
//  Helper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import Foundation


enum ActiveSheet: Identifiable {
    case splash, welcome, addLevel, addDate

    var id: Int {
        hashValue
    }
}
