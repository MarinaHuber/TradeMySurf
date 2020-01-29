//
//  AddLevelViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import SwiftyPickerPopover


class AddLevelViewController: UIViewController, StoryboardProtocol {
    
	@IBOutlet weak var pickerView: UIView!
    let levels = [Level.Beginner.rawValue, Level.BeginnerIntemediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]

    override func viewDidLoad() {
        super.viewDidLoad()
        let pastelGreen = UIColor(named: "pastel")
        self.view.applyGradient(withColors: [pastelGreen!, .systemGray3, .white], gradientOrientation: .topRightBottomLeft)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setPickerPopover()
    }
}

private extension AddLevelViewController {
    private func setPickerPopover() {
        StringPickerPopover(title: "Choose one", choices: levels)
            .setSize(width: view.bounds.size.width, height: 250)
            .setRowHeight(60)
            .setSelectedRow(0)
            .setFontSize(17)
            .setPermittedArrowDirections([.up])
            .setOutsideTapDismissing(allowed: false)
            .setDoneButton(title: "Next", font: UIFont.boldSystemFont(ofSize: 17), color: .systemIndigo, action: { popover, _, selectedString in
                UserDefaults.standard.selectedLevel = selectedString
                popover.disappear()
                self.scenePresenter?.presentAddDate()
            })
            .appear(originView: pickerView, baseViewController: self)
    }
}
