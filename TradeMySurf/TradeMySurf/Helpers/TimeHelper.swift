//
//  TimeHelper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

class TimeHelper {

    static func timeString(from date: Date) -> Int {

        let components: DateComponents?
		/// ignores the time zone of the calendar the method is called on and uses the passed in time zone instead
		components = Calendar.current.dateComponents([.month], from: date, to: Date())
//
//        switch (components?.day, components?.month, components?.year) {
//
//        case (.some(let days), 0?, 0?): return "for \(days)"
//        case (_, .some(let months), 0?): return "\(months)"
//        case (_, _, .some(let years)): return "\(years)"
/// here we get the Int for the month
		switch (components?.month){

		case (.some(let month)): return month

        case (_): return 0
        }
    }
}


extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: self)
    }
}
