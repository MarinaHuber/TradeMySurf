//
//  TimeHelper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/2/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

extension Date {
/// ignores the time zone of the calendar the method is called on and uses the passed in time zone instead
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: self)
    }
}

extension Date {

  func dateAsString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}
