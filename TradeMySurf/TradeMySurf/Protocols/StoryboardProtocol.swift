//
//  StoryboardProtocol.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
// Inspired from Coordinator-Example by G. Lombardo
// To use this extension, you need to create a separate storyboard for each UIViewController.
// The name of the storyboard must match the name of the UIViewController‘s class.
// This UIViewController must be set as the initial UIViewController for this storyboard.
// *******************************************************************************************

//protocol StoryboardProtocol: NSObjectProtocol {
//    static func instantiate() -> Self
//}
//
//// splits by the dot and uses everything after, giving "MyViewController"
//
//extension StoryboardProtocol where Self: UIViewController {
//
//    static func instantiate() -> Self {
//        let fullName = NSStringFromClass(self)
//		let className = fullName.components(separatedBy: ".")[1]
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        return storyboard.instantiateViewController(withIdentifier: className) as! Self
//    }
//}


//protocol StoryboardProtocol: NSObjectProtocol {
//  associatedtype MyType  // 1
//  static var defaultFileName: String { get }  // 2
//  static func instantiateViewController(_ bundle: Bundle?) -> MyType // 3
//}
//
//extension StoryboardProtocol where Self: UIViewController {
//  static var defaultFileName: String {
//    return NSStringFromClass(Self.self).components(separatedBy: ".").last!
//  }
//
//  static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
//    let fileName = defaultFileName
//    let sb = UIStoryboard(name: fileName, bundle: bundle)
//    return sb.instantiateInitialViewController() as! Self
//  }
//}
import UIKit

protocol StoryboardProtocol {
    static func instantiate() -> Self
}

extension StoryboardProtocol where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
// this splits by the dot and uses everything after, giving "MyViewController"
		let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Tutorial", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
