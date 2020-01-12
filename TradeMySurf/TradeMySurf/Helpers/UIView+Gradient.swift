//
//  UIView+Gradient.swift
//  TradeMySurf
//
//  Created by Marina Huber on 1/12/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

enum GradientOrientation {

    case topRightBottomLeft
    case topLeftBottomRight
    case horizontal
    case vertical

    var startPoint: CGPoint {
        return points.startPoint
    }

    var endPoint: CGPoint {
        return points.endPoint
    }

    var points: GradientPoints {

        switch self {

        case .topRightBottomLeft:
            return (CGPoint.init(x: 0.0, y: 1.0), CGPoint.init(x: 1.0, y: 0.0))

        case .topLeftBottomRight:
            return (CGPoint.init(x: 0.0, y: 0.0), CGPoint.init(x: 1, y: 1))

        case .horizontal:
            return (CGPoint.init(x: 0.0, y: 0.5), CGPoint.init(x: 1.0, y: 0.5))

        case .vertical:
            return (CGPoint.init(x: 0.0, y: 0.0), CGPoint.init(x: 0.0, y: 1.0))
        }
    }
}

extension UIView {

    /// Adds a gradient to UIView
    func applyGradient(withColors colors: [UIColor], locations: [NSNumber]? = nil) {

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }

    /// Adds a gradient to UIView
    func applyGradient(withColors colors: [UIColor], gradientOrientation orientation: GradientOrientation) {

        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map { $0.cgColor }
        gradient.startPoint = orientation.startPoint
        gradient.endPoint = orientation.endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }
}
