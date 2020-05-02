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
    func presentWelcome()
    func presentAddLevel()
    func presentAddDate()
    func presentTabBar()
    func presentAlert()
    func presentDetailBoard(_ data: Surfboard)

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
