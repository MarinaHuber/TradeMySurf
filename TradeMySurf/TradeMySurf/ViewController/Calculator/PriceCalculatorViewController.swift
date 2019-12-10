//
//  PriceCalendarViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class PriceCalculatorViewController: UIViewController {
	weak var coordinator: CalculatorCoordinator?

    let surfBoards = Surfs()

    @IBOutlet var stackView: UIStackView!
    @IBOutlet var model: UISegmentedControl!
    @IBOutlet var gear: UISegmentedControl!
    @IBOutlet var hoursLabel: UILabel!
    @IBOutlet var production: UISlider!
    @IBOutlet var condition: UISegmentedControl!
    @IBOutlet var valuation: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        stackView.setCustomSpacing(10, after: model)
        stackView.setCustomSpacing(10, after: gear)
        stackView.setCustomSpacing(10, after: production)
        stackView.setCustomSpacing(10, after: condition)

        calculateValue(self)
    }

    @IBAction func calculateValue(_ sender: Any) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let formattedMileage = formatter.string(for: production.value) ?? "0"
        hoursLabel.text = "Hours on water (\(formattedMileage) hours)"

        if let prediction = try? surfBoards.prediction(model: Double(model.selectedSegmentIndex), gear: Double(gear.selectedSegmentIndex), production: Double(production.value), condition: Double(condition.selectedSegmentIndex)) {
            let clampedValuation = max(1000, prediction.price)
            formatter.numberStyle = .currency
            valuation.text = formatter.string(for: clampedValuation)
        } else {
            valuation.text = "Error"
        }
    }

}

extension PriceCalculatorViewController: StoryboardProtocol {}
