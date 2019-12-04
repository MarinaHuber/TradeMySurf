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
		DatePickerPopover(title: "Pick a start date")
			.setLocale(identifier: "en_GB")
			.setDimmedBackgroundView(enabled: true)
			.setValueChange(action: { _, selectedDate in
				///save to UD
				print("current date \(selectedDate)")
			})
			.setDoneButton(action: { popover, _ in
				popover.disappear()
				self.delegate?.performTabBar()
			})
			.setCancelButton(action: { _, _ in
				print("cancel")})
			.setClearButton(action: { popover, _ in
				print("clear")
				popover.setSelectedDate(Date()).reload()
			})
		.appear(originView: sender, baseViewController: self)

	}
	@IBAction func backTap(_ sender: Any) {
		self.dismiss(animated: true)
	}
	@IBAction func openTabBar(_ sender: Any) {
		delegate?.performTabBar()
	}
}

extension AddDateViewController: StoryboardProtocol {}
