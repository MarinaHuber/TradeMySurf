//
//  CoordinatorPresenting.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/29/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

protocol CoorinatorPresenting {
    func presentSplash()
    func presentTabBar()

}


extension UIResponder {
    var scenePresenter: CoorinatorPresenting? {
        var current: UIResponder? = self
        repeat {
            if let presenter = current as? CoorinatorPresenting {
                return presenter
            }
            current = current?.next
        } while current != nil
        
        return nil
    }
}
