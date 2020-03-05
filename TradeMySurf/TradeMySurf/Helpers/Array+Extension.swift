//
//  Array+Extension.swift
//  TradeMySurf
//
//  Created by Marina Huber on 3/4/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//


import UIKit

public extension Array {
    
    /// Element at the given index if it exists.
    ///
    /// - Parameter index: index of element.
    /// - Returns: optional element (if exists).
     func item(at index: Int) -> Element? {
        
        if 0..<self.count ~= index {
            return self[index]
        }
        
        return nil
    }
}
