//
//  SavedValue.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct SavedValue<T> {

    private let key: String
    private let defaultValue: T?

    init(_ key: String, defaultValue: T? = nil) {

        self.key = key
        self.defaultValue = defaultValue
    }

    var value: T? {
        get {
            if let value = UserDefaults.standard.object(forKey: key) as? T {
                return value
            }
            if let defaultValue = defaultValue {
                return defaultValue
            }
            return nil
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}
