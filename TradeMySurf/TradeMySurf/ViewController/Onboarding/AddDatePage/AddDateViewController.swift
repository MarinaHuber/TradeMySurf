//
//  AddDateViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/28/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import  SwiftyPickerPopover

class AddDateViewController: UIViewController, StoryboardProtocol {

    @IBOutlet weak var pickerViewDate: UIView!
    private var userFinishedOnboarding = UserDefaults.standard.userWasHere

    override func viewDidLoad() {
        super.viewDidLoad()
        let pastelGreen = UIColor(named: "pastel")
        self.view.applyGradient(withColors: [pastelGreen!, .systemGray2, .white], gradientOrientation: .topRightBottomLeft)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tapDateSpringPopoverPicker()
        self.view.verShake()
    }
}

private extension AddDateViewController {
    func tapDateSpringPopoverPicker() {
        DatePickerPopover(title: "Pick a surf date")
            .setDateMode(.date)
            .setSelectedDate(Date())
            .setLocale(identifier: "en_GB_POSIX")
            .setOutsideTapDismissing(allowed: false)
            .setSize(width: view.bounds.size.width, height: 250)
            .setPermittedArrowDirections([.up])
            .setDimmedBackgroundView(enabled: true)
            .setOutsideTapDismissing(allowed: false)
            .setClearButton(title: "This is what will appear in your surf recommendations", font: UIFont.systemFont(ofSize: 11), color: .systemIndigo, action: { popover, selectedDate in
                            print("clear")
                            //Rewind
                            popover.setSelectedDate(Date()).reload()
                        })
            .setDoneButton(title: "Done", font: UIFont.boldSystemFont(ofSize: 17), color: .systemIndigo, action: { popover, date in
                UserDefaults.standard.surfingTime = date
                popover.disappear()
                self.scenePresenter?.presentTabBar()
                self.userFinishedOnboarding = true
            })
            .appear(originView: pickerViewDate, baseViewController: self)
    }
}
