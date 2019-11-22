//
//  AddDateViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import  SwiftyPickerPopover

protocol AddDateViewControllerDelegate: class {
	func performTabBar()
}

class AddDateViewController: UIViewController {
	weak var delegate: AddDateViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	@IBAction func tapDateSpringPopoverPicker(_ sender: UIButton) {
		let popover = DatePickerPopover(title: "Clearable DatePicker")
			.setLocale(identifier: "en_GB") //en_GB is dd-MM-YYYY. en_US is MM-dd-YYYY. They are both in English.
			.setValueChange(action: { _, selectedDate in
				print("current date \(selectedDate)")
			})
			.setDoneButton(action: { popover, selectedDate in print("selectedDate \(selectedDate)")} )
			.setCancelButton(action: { _, _ in print("cancel")})
			.setClearButton(action: { popover, _ in
				print("clear")
				popover.setSelectedDate(Date()).reload()
			})
		popover.appear(originView: sender, baseViewController: self)
		popover.disappearAutomatically(after: 5.0)
	}
	@IBAction func openTabBar(_ sender: Any) {
		delegate?.performTabBar()
	}
}

extension AddDateViewController: StoryboardProtocol {}
