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
		DatePickerPopover(title: "DatePicker")
		.setDateMode(.date)
		.setSelectedDate(Date())
		.setDoneButton(action: { popover, selectedDate in print("selectedDate \(selectedDate)")})
		.setCancelButton(action: { _, _ in print("cancel")})
		.appear(originView: view.superview ?? UIView(), baseViewController: self)
	}

	@IBAction func openTabBar(_ sender: Any) {
		delegate?.performTabBar()
	}
}

extension AddDateViewController: StoryboardProtocol {}
