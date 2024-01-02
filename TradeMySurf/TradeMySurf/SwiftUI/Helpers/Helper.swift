//
//  Helper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import Foundation


enum Sheet: Identifiable, CaseIterable {
    case confirm, location, surfDetail

    var id: Int {
        hashValue
    }
}

enum Page: Identifiable {
    case surfTrip

    var id: Int {
        hashValue
    }
}

enum FullScreenCover: Identifiable, CaseIterable {
    case splash, welcome, addLevel, addDate

    var id: Int {
        hashValue
    }
}

