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

    override func viewDidLoad() {
        super.viewDidLoad()
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
            .setDateMode(.date)
            .setSelectedDate(Date())
            .setLocale(identifier: "en_GB_POSIX")
            .setOutsideTapDismissing(allowed: false)
            .setSize(width: view.bounds.size.width, height: 200)
            .setPermittedArrowDirections([.up])
            .setDoneButton(title: "Done", font: UIFont.boldSystemFont(ofSize: 17), color: .systemBlue, action: { popover, date in
                UserDefaults.standard.surfingTime = date
                popover.disappear()
                self.delegate?.performTabBar()
            })
            .appear(originView: pickerViewDate, baseViewController: self)
    }
}

extension AddDateViewController: StoryboardProtocol {}
