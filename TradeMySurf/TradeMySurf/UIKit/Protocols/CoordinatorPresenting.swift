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
    func presentDetailBoard(_ data: Surfboard)
    func presentDetailLocation(_ data: Surfboard)
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
//- MARK: generic version of above

//extension UIResponder {
//    func next<T:UIResponder>(ofType: T.Type) -> T? {
//        let r = self.next
//        if let r = r as? T ?? r?.next(ofType: T.self) {
//            return r
//        } else {
//            return nil
//        }
//    }
//}

/////USAGE
//if let vc = self.next(ofType: UIViewController.self) {
//    vc.present(imagePicker, animated: true, completion: nil)
//}
