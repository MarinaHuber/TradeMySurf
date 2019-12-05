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

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		setPickerPopover()
	}
	@IBAction func didTapStringPickerWithImageButton(_ sender: UIButton) {
		setPickerPopover()
	}

	@IBAction func openAddDate(_ sender: Any) {
		delegate?.performNext()

	}

	private func setPickerPopover() {
		StringPickerPopover(title: "Choose one", choices: levelsData)
			.setSize(width: view.frame.size.width - 10, height: view.frame.size.height/5)
			.setDimmedBackgroundView(enabled: true)
			.setRowHeight(60)
			.setFontSize(16)
			.setOutsideTapDismissing(allowed: false)
			.setValueChange(action: { _, _, selectedString in
				UserDefaults.standard.selectedLevel = selectedString
				print(" from Picker selected: \(selectedString)")
			})
			.setDoneButton(action: { popover, _, _ in
				popover.disappear()
				self.delegate?.performNext()

			})
			.appear(originView: pickerView, baseViewController: self)

	}

}

extension AddLevelViewController: StoryboardProtocol {}
