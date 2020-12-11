//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
    
    func verShake(){
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 1.5
        animation.values = [0, -7, 2, -7, 2, -7, 2, -7, 2, 0]
        layer.add(animation, forKey: "shake")
    }
}

extension UIButton {

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
