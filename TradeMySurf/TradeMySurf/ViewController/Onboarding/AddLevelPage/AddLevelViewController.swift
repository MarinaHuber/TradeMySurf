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
    let selcetedRow = 2
    private var userSettup = UserDefaults.standard.didUserSetUp
	var addLevel = UILabel()
	var iconViewAnima = AnimationView()
	let levelsData = [Level.beginner.rawValue, Level.beginnerIntemediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue, Level.professional.rawValue]

    override func viewDidLoad() {
        super.viewDidLoad()
        setPickerPopover()
    }

	@IBAction func openAddDate(_ sender: Any) {
		delegate?.performNext()

	}
}

private extension AddLevelViewController {

	private func setPickerPopover() {
		StringPickerPopover(title: "Choose one", choices: levelsData)
			.setSize(width: view.bounds.size.width, height: 200)
			.setRowHeight(60)
			.setSelectedRow(selcetedRow)
			.setFontSize(16)
            .setPermittedArrowDirections([.up])
			.setOutsideTapDismissing(allowed: false)
			.setValueChange(action: { _, row, selectedString in
                if row == self.selcetedRow {
                    UserDefaults.standard.selectedLevel = Level.intermediate.rawValue
                }
				UserDefaults.standard.selectedLevel = selectedString
                self.userSettup = false
			})
			.setDoneButton(title: "Next", font: UIFont.boldSystemFont(ofSize: 17), color: .systemBlue, action: { popover, _, _ in
				popover.disappear()
				self.delegate?.performNext()
			})
			.setClearButton(title: "This will appear in your surf recommendations", font: UIFont.boldSystemFont(ofSize: 9), color: .gray, action: nil)
			.appear(originView: pickerView, baseViewController: self)
	}

}

extension AddLevelViewController: StoryboardProtocol {}
