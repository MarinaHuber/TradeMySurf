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
	func performAddDate()
}

class AddLevelViewController: UIViewController {
	@IBOutlet weak var pickerView: UIView!
	weak var delegate: AddLevelViewControllerDelegate?
	let levels = [Level.beginner.rawValue, Level.beginnerIntemediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue, Level.professional.rawValue]

    override func viewDidLoad() {
        super.viewDidLoad()
        setPickerPopover()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setPickerPopover()
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
            .setDoneButton(title: "Next", font: UIFont.boldSystemFont(ofSize: 17), color: .systemBlue, action: { popover, _, selectedString in
                UserDefaults.standard.selectedLevel = selectedString
                popover.disappear()
                self.delegate?.performAddDate()
            })
            .appear(originView: pickerView, baseViewController: self)
    }
}

extension AddLevelViewController: StoryboardProtocol {}
