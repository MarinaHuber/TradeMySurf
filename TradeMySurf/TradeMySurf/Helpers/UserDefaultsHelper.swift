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
		/// Read value from UserDefaults returns T
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
		/// Set value to UserDefaults
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}

// MARK: - View Count

extension UserDefaultsHelper {

    private var viewCountKey: String { return "ViewCount" }

    /// Returns how many times the ViewController has been viewed.

    func fetchViewControllerViewedCount() -> Int {
        return UserDefaults.standard.integer(forKey: viewCountKey)
    }

    /// Incremenets and saves how many times the ViewController has been viewed.

    func set(viewControllerViewedCount count: Int) {
        UserDefaults.standard.set(count, forKey: viewCountKey)
    }

}
