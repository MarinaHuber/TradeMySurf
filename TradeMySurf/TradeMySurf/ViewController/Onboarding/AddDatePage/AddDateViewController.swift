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
		DatePickerPopover(title: "Pick a surf date")
			.setLocale(identifier: "en_US_POSIX")
			.setOutsideTapDismissing(allowed: false)
			.setArrowColor(.systemGray4)
			.setValueChange(action: { _, selectedDate in
				///save to UD
				UserDefaults.standard.surfingTime = selectedDate
			})
			.setDoneButton(title: "Done", font: UIFont.boldSystemFont(ofSize: 17), color: .systemBlue, action: { popover, _ in
					popover.disappear()
					//missing: UserDefaults.standard.didUserSetUp = true
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
