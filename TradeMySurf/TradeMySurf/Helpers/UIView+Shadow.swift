//
//  UIView+Shadow.swift
//
//  Created by Anja Törpsch on 15/08/2018.
//

import UIKit

extension UIView {

    /// Adds an default schadow at view without a specific path (all sides)
    /// - parameters:
    ///     - color: Color of Shadow. Default UIColor.black
    ///     - radius: Radius of Shadow. Default 2.0
    ///     - opacity: Opacity of Shadow. Default 0.24
    ///     - offset: Shadow offset. Default CGSize(width: 0.0, height: 2.0)
    public func addShadow(color: UIColor = .black, radius: CGFloat = 2.0, opacity: Float = 0.24, offset: CGSize = CGSize(width: 0.0, height: 2.0)) {

        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }

    /// Adds a border to UIView
    /// - parameters:
    ///     - color: Color of Border. Default UIColor.white
    ///     - width: Width of Border. Default: 0.5
    public func addBorder(color: UIColor = .white, width: CGFloat = 0.5) {

        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
