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
    let levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]

    override func viewDidLoad() {
        super.viewDidLoad()
        let pastelGreen = UIColor(named: "pastel")
        self.view.applyGradient(withColors: [pastelGreen!, .systemGray3, .white], gradientOrientation: .topRightBottomLeft)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setPickerPopover()
        self.view.verShake()
    }
}

private extension AddLevelViewController {
    private func setPickerPopover() {
        StringPickerPopover(title: "Please choose one", choices: levels)
            .setSize(width: view.bounds.size.width, height: 200)
            .setRowHeight(60)
            .setSelectedRow(0)
            .setFontSize(17)
            .setPermittedArrowDirections([.up])
            .setDimmedBackgroundView(enabled: true)
            .setOutsideTapDismissing(allowed: false)
            .setDoneButton(title: "Next", font: UIFont.boldSystemFont(ofSize: 17), color: .systemIndigo, action: { popover, _, selectedString in
                UserDefaults.standard.selectedLevel = selectedString
                popover.disappear()
                self.scenePresenter?.presentAddDate()
            })
            .setClearButton(title: "This is what will appear in your surf recommendations", font: UIFont.systemFont(ofSize: 11), color: .systemIndigo, action:  { popover, _, _ in })
            .appear(originView: pickerView, baseViewController: self)
    }
}
