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

	@IBOutlet weak var pickerView: UIView!
	weak var delegate: AddLevelViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
	var addLevel = UILabel()
	var iconViewAnima = AnimationView()
	let levelsData = [Level.beginner.rawValue, Level.beginnerIntemediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue, Level.professional.rawValue]

	override func viewDidLoad() {
		super.viewDidLoad()
		setPickerPopover()
	}
	@IBAction func didTapStringPickerWithImageButton(_ sender: UIButton) {
		//setPickerPopover()
	}

	@IBAction func openAddDate(_ sender: Any) {
		delegate?.performNext()

	}

	private func setPickerPopover() {
		StringPickerPopover(title: "Choose one", choices: levelsData)
			.setSize(width: 300)
			.setCornerRadius(40)
			.setRowHeight(60)
			.setFontSize(16)
			.setValueChange(action: { _, _, selectedString in
				var storedObject = StorageData.surfLevel
				storedObject = selectedString
				let level = Level.enumFromString(string: storedObject)
				print(" from Picker selected: \(String(describing: level))")
			})
			.setDoneButton(action: { popover, _, _ in
				popover.disappear()
				self.delegate?.performNext()

			})

			.setDimmedBackgroundView(enabled: true)
			.appear(originView: pickerView, baseViewController: self)


	}

}

extension AddLevelViewController: StoryboardProtocol {}
