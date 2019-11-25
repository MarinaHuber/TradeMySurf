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

	weak var delegate: AddLevelViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
	var addLevel = UILabel()
	var iconViewAnima = AnimationView()
	let levelsData = [Levels.beginner.rawValue, Levels.beginnerIntemediate.rawValue, Levels.intermediate.rawValue, Levels.advanced.rawValue, Levels.professional.rawValue]

	override func viewDidLoad() {
		super.viewDidLoad()
	}
	@IBAction func didTapStringPickerWithImageButton(_ sender: UIButton) {
		let popover = StringPickerPopover(title: "with image", choices: levelsData)
			.setImageNames(["iconbaby","iconstand","iconwalk", "iconrun", "iconfly"])
			.setSize(width: 350)
			.setCornerRadius(40)
			.setRowHeight(90)
			.setFontSize(16)
			.setValueChange(action: { _, _, selectedString in
			})
			.setDoneButton(action: {
				_, selectedRow, selectedString in
			})
			.setCancelButton(action: nil)
			.setOutsideTapDismissing(allowed: false)
			.setDimmedBackgroundView(enabled: true)
		popover.appear(originView: sender, baseViewController: self)
		popover.disappearAutomatically(after: 5.0, completion: nil)
	}

	@IBAction func openAddDate(_ sender: Any) {
		delegate?.performNext()
	}

}

extension AddLevelViewController: StoryboardProtocol {}