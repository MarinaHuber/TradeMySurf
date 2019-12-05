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
			.setLocale(identifier: "en_US_POSIX")
			.setDimmedBackgroundView(enabled: true)
			.setValueChange(action: { _, selectedDate in
				///save to UD
				UserDefaults.standard.surfingTime = selectedDate
				//let time = TimeHelper.timeString(from: selectedDate)
				let monthOfYear = selectedDate.month
				print("current date \(monthOfYear)")

				let dateFormat = DateFormatter()
				dateFormat.dateFormat = "LLLL"
				let date = dateFormat.date(from: monthOfYear)
				let monthInt = Calendar.current.component(.month, from: date!)
					print("into int: \(monthInt)")
			})
			.setDoneButton(action: { popover, _ in
				popover.disappear()
				self.delegate?.performTabBar()
			})
//			.setClearButton(action: { popover, _ in
//				popover.setSelectedDate(Date()).reload()
//			})
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
