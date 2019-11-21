//
//  AddLevelViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import Lottie
import SwiftyPickerPopover

protocol AddLevelViewControllerDelegate: class {
	func performNext()
}

class AddLevelViewController: UIViewController {

	weak var delegate: AddLevelViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
	var addLevel = UILabel()
	var iconViewAnima = AnimationView()
	let unitsLevelData = [UserDefaultsUnitKey.beginner.rawValue, UserDefaultsUnitKey.beginnerIntemediate.rawValue, UserDefaultsUnitKey.intermediate.rawValue, UserDefaultsUnitKey.advanced.rawValue, UserDefaultsUnitKey.professional.rawValue]

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	@IBAction func choiceButton(_ sender: UIButton) {
		let displayStringFor:((String?) -> String?)? = { string in
			if let str = string {
				switch(str) {
				case (Levels.beginner).rawValue:
					return "😊 \(Levels.beginner.rawValue)"
				case (Levels.beginnerIntemediate).rawValue:
					return "😏 \(Levels.beginnerIntemediate.rawValue)"
				case (Levels.intermediate).rawValue:
					return "😓 \(Levels.intermediate.rawValue)"
				case (Levels.advanced).rawValue:
					return "\(Levels.intermediate.rawValue)"
				case (Levels.professional).rawValue:
					return "😓"
				default:
					return str
				}
			}
			return nil
		}
		StringPickerPopover(title: "My one goal", choices:[])
			.setRowHeight(80)
			.setPermittedArrowDirections(.up)
			.setDisplayStringFor(displayStringFor)
			.setFontSize(26.5)
			.setFontColor(.black)
			.setDimmedBackgroundView(enabled: true)
			.setOutsideTapDismissing(allowed: true)

			.setSize(width: 350, height: 200)
			.appear(originView: sender, baseViewController: self)
	}

	func pickerView(_ pickerView: StringPickerPopover, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		let label: UILabel

		if let view = view {
			label = view as! UILabel
		}
		else {
			label = UILabel(frame: CGRect(x: 0, y: 0, width: 350, height: 100))
		}

		//label.text = pickerView.setDisplayStringFor(displayStringFor)
		label.lineBreakMode = .byWordWrapping
		label.numberOfLines = 0
		label.sizeToFit()

		return label
	}

	@IBAction func openAddDate(_ sender: Any) {
		delegate?.performNext()
	}
}

extension AddLevelViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return UserDefaultsUnitKey.allCases[row].rawValue
    }
}

extension AddLevelViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return UserDefaultsUnitKey.allCases.count
    }
}
extension AddLevelViewController: StoryboardProtocol {}
