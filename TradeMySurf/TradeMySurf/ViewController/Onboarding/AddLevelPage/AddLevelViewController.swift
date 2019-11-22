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

        /// StringPickerPopover with image:
		let pop = StringPickerPopover(title: "with image", choices: levelsData)
            .setImageNames(["suefboardSell2x","suefboardSell2x","suefboardSell2x", "suefboardSell2x", "suefboardSell2x"])
            .setSize(width: 350)
            .setCornerRadius(40)
		    .setRowHeight(60)
			.setFontSize(16)
			//.setFontColor(.black)
            .setValueChange(action: { _, _, selectedString in
                print("current string: \(selectedString)")
            })
            .setDoneButton(action: {
                popover, selectedRow, selectedString in
                print("done row \(selectedRow) \(selectedString)")
            })
            .setCancelButton(action: {_, _, _ in
                print("cancel") })
            .setOutsideTapDismissing(allowed: false)
            .setDimmedBackgroundView(enabled: true)
        pop.appear(originView: sender, baseViewController: self)
		pop.disappearAutomatically(after: 5.0, completion: { print("automatically hidden")} )
	}

	@IBAction func openAddDate(_ sender: Any) {
		delegate?.performNext()
	}

}

extension AddLevelViewController: StoryboardProtocol {}
