//
//  SavedValue.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultsHelper<T> {
  let key: String
  let defaultValue: T

  var wrappedValue: T {
    get {
		// Read value from UserDefaults returns Any Type
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
		// Set value to UserDefaults
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}
