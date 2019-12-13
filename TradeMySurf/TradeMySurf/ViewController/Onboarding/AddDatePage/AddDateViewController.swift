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

	@IBOutlet weak var pickerViewDate: UIView!

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		tapDateSpringPopoverPicker()
	}
	@IBAction func backTap(_ sender: Any) {
		self.dismiss(animated: true)
	}
	@IBAction func openTabBar(_ sender: Any) {
		delegate?.performTabBar()
	}
}
private extension AddDateViewController {

	func tapDateSpringPopoverPicker() {
		DatePickerPopover(title: "Pick a surf date")
			.setLocale(identifier: "en_US_POSIX")
			.setOutsideTapDismissing(allowed: false)
            .setSize(width: view.bounds.size.width, height: 200)
            .setPermittedArrowDirections([.up])
			.setValueChange(action: { _, selectedDate in
				///save to UD
				UserDefaults.standard.surfingTime = selectedDate
			})
			.setDoneButton(title: "Done", font: UIFont.boldSystemFont(ofSize: 17), color: .systemBlue, action: { popover, _ in
					popover.disappear()
					//missing: UserDefaults.standard.didUserSetUp = true
					self.delegate?.performTabBar()
			})
  		.appear(originView: pickerViewDate, baseViewController: self)

	}
}

extension AddDateViewController: StoryboardProtocol {}
