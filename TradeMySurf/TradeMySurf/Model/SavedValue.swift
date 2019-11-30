//
//  SavedValue.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

@propertyWrapper
struct SavedValue<T> {
  let key: String
  let defaultValue: T

  var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}

// save Date as String  ??
//let date = DateFormatter()
//date.dateFormat = "dd/MM/yyyy"
//let str = ddate.string(from: Date())
//UserDefaults.standard.setValue(str, forKey: key)
