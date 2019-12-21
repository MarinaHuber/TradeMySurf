//
//  AddLevelViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import SwiftyPickerPopover

protocol AddLevelViewControllerDelegate: class {
	func performNext()
}

class AddLevelViewController: UIViewController {
	@IBOutlet weak var pickerView: UIView!
	weak var delegate: AddLevelViewControllerDelegate?
	weak var coordinator: TabBarCoordinator?
    private var userSettup = UserDefaults.standard.didUserSetUp
	let levels = [Level.beginner.rawValue, Level.beginnerIntemediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue, Level.professional.rawValue]

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
        StringPickerPopover(title: "Choose one", choices: levels)
            .setSize(width: view.bounds.size.width, height: 200)
            .setRowHeight(60)
            .setSelectedRow(2)
            .setFontSize(16)
            .setPermittedArrowDirections([.up])
            .setOutsideTapDismissing(allowed: false)
            .setValueChange(action: { _, _, selectedString in
                UserDefaults.standard.selectedLevel = selectedString
            })
            .setDoneButton(title: "Next", font: UIFont.boldSystemFont(ofSize: 17), color: .systemBlue, action: { popover, _, selectedString in
                if selectedString == Level.intermediate.rawValue {
                    UserDefaults.standard.selectedLevel = Level.intermediate.rawValue
                }
                popover.disappear()
                self.delegate?.performNext()
            })
            .appear(originView: pickerView, baseViewController: self)
    }
}

extension AddLevelViewController: StoryboardProtocol {}
