//
//  GradientView.swift
//  TradeMySurf
//
//  Created by Ujval Shah on 15/09/22.
//  Copyright © 2022 Marina Huber. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {

    @IBInspectable var FirstColor:UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var SecondColor:UIColor = UIColor.clear {
        didSet{
            updateView()
        }

    }
    @IBInspectable var ThirdColor:UIColor = UIColor.clear {
        didSet{
            updateView()
        }

    }
    override class var layerClass: AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    func updateView(){
        let layer = self.layer as! CAGradientLayer
        layer.colors = [FirstColor.cgColor , SecondColor.cgColor,ThirdColor.cgColor]
    }
   
}
