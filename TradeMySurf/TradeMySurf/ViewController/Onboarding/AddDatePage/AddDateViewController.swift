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

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func tapDateSpringPopoverPicker(_ sender: UIButton) {
		DatePickerPopover(title: "Pick a start date")
			.setLocale(identifier: "en_US_POSIX")
			.setDimmedBackgroundView(enabled: true)
			.setOutsideTapDismissing(allowed: false)
			.setValueChange(action: { _, selectedDate in
				///save to UD
				UserDefaults.standard.surfingTime = selectedDate
			})
			.setDoneButton(action: { popover, _ in
				popover.disappear()
				//UserDefaults.standard.didUserSetUp = true
				self.delegate?.performTabBar()
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
