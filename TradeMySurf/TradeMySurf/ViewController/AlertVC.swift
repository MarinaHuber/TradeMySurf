//
//  AlertVC.swift
//  Planets
//
//  Created by Marina Huber on 1/21/20.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit

class AlertVC: UIViewController, StoryboardProtocol {
    
    @IBOutlet var icon: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyLabel: UILabel!
    @IBOutlet weak var bodyText: UILabel!
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet var alternateButton: UIButton!
    
    var selectedDate = UserDefaults.standard.surfingTime
    var selectedLevel = UserDefaults.standard.selectedLevel
    let levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]
    
// MARK: Managing the Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        if UserDefaults.standard.userWasHere == false {
//            self.view.isHidden = false
//            UserDefaults.standard.userWasHere = true
//        } else {
//            self.view.isHidden = true
//        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confirmButton.addBorder(color: .black, width: 0.5)
        alternateButton.addBorder(color: .black, width: 0.5)
        titleLabel.text = "\(selectedLevel ?? "")"
        bodyLabel.text = "Surfing start:  \(selectedDate?.dateAsString(style: .long) ?? "")"
        _ = levels.map {
            if $0 == selectedLevel {
                let levelEnum = Level(rawValue: $0)
                bodyText.text = "You are matched to surfboards and locations suitable for your \(levelEnum.unsafelyUnwrapped) level and date!"
        }
      }
    }
    
    /// Called when the alternate button is tapped. This dismisses the alert then runs our alternate action.
    @IBAction func repeatTapped(_ sender: UIButton) {
        // dismiss the alert immediately
        scenePresenter?.presentAddLevel()
        selectedLevel = nil
        selectedDate = nil
        UserDefaults.standard.userWasHere = false
    }
    
    /// Called when the OK button was tapped. If we have a coordinator let it decide what should happen; if not, just dismiss the alert.
    @IBAction func dismissTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
