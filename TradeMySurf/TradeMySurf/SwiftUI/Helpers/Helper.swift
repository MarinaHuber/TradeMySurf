//
//  Helper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import Foundation


enum SheetRoute: Hashable {
    case confirm, location, surfDetail
}

enum FullScreenRoute: Hashable, Identifiable {
    var id: Int {
        hashValue
    }

    case splash, welcome, addLevel, addDate
}

