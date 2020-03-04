//
//  UIView+Constraints.swift
//  TradeMySurf
//
//  Created by Marina Huber on 3/4/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

extension UIView {
    /// View position equal superview
    func positionEqualSuperview() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(attribute: NSLayoutConstraint.Attribute.top)
        self.addConstraint(attribute: NSLayoutConstraint.Attribute.leading)
        self.addConstraint(attribute: NSLayoutConstraint.Attribute.trailing)
        self.addConstraint(attribute: NSLayoutConstraint.Attribute.bottom)
    }
    
    /// Set given attribute equal to the same attribute of superview
    func addConstraint(attribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0) {

        guard let superview = self.superview else {
            return
        }

        superview.addConstraint(NSLayoutConstraint(
            item: superview, attribute: attribute, relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: self, attribute: attribute, multiplier: multiplier, constant: constant))
    }
}
