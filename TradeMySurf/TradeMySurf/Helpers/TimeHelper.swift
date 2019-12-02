//
//  TimeHelper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

class TimeHelper {

    static func timeString(from date: Date) -> String {

        let components: DateComponents?
        components = Calendar.current.dateComponents([.day, .month, .year], from: date, to: Date())

        switch (components?.day, components?.month, components?.year) {

        case (.some(let days), 0?, 0?): return "for \(days)"
        case (_, .some(let months), 0?): return "\(months)"
        case (_, _, .some(let years)): return "\(years)"

        case (_, _, _): return ""
        }
    }
}
