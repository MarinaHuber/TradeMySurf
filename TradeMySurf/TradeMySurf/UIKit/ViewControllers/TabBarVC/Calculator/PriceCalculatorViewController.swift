//
//  PriceCalendarViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import SwiftUI

class PriceCalculatorViewController: UIViewController, StoryboardProtocol {

    
    @IBOutlet weak var materialSegmented: UISegmentedControl!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var model: UISegmentedControl!
    @IBOutlet var gear: UISegmentedControl!
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var production: UISlider!
    @IBOutlet var condition: UISegmentedControl!
    @IBOutlet var valuation: UILabel!

    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        let image : UIImage = UIImage(named: "logo_wave")!
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = image
//        navigationItem.titleView = imageView
//        view.applyGradient(withColors: [.systemIndigo, .systemIndigo, .systemTeal, .lightGray], gradientOrientation: .topLeftBottomRight)
//        stackView.setCustomSpacing(10, after: model)
//        stackView.setCustomSpacing(10, after: gear)
//        stackView.setCustomSpacing(10, after: production)
//        stackView.setCustomSpacing(10, after: condition)
//        
//        calculateValue(self)

        let swiftUIView = CalculatorView()
        let host = UIHostingController(rootView: swiftUIView)
        let hostView = host.view!
        hostView.translatesAutoresizingMaskIntoConstraints = false

        addChild(host)
        view.addSubview(hostView)
        hostView.contrainToSuperviewEdges()
        host.didMove(toParent: self)

    }

    @IBAction func calculateValue(_ sender: Any) {
//        let formatter = NumberFormatter()
//        formatter.numberStyle = .none
//        let formattedMileage = formatter.string(for: production.value) ?? "0"
//        hoursLabel.text = "Hours on water (\(formattedMileage) hours)"
//
//        if let prediction = try? PriceCalculatorViewController.surfBoards.prediction(model: Double(model.selectedSegmentIndex), material: Double(materialSegmented.selectedSegmentIndex), gear: Double(gear.selectedSegmentIndex), production: Double(production.value), condition: Double(condition.selectedSegmentIndex)) {
//            let clampedValuation = max(10, prediction.price)
//            formatter.numberStyle = .currency
//            valuation.text = formatter.string(for: clampedValuation)
//        } else {
//            valuation.text = "Error"
//        }
   }

}
