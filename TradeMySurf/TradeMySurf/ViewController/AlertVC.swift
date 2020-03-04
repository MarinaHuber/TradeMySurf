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
    let selectedDate = UserDefaults.standard.surfingTime
    let selectedLevel = UserDefaults.standard.selectedLevel
    let levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]
    
    // MARK: Managing the View
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        confirmButton.addBorder(color: .white, width: 0.5)
        alternateButton.addBorder(color: .white, width: 0.5)
        titleLabel.text = "\(selectedLevel ?? "")"
        bodyLabel.text = "Surfing period:  \(selectedDate?.dateAsString(style: .long) ?? "")"
        _ = levels.map {
            if $0 == selectedLevel {
                let levelEnum = Level(rawValue: $0)
                bodyText.text = "Your goal is matched to surfboards and locations suitable for your \(levelEnum.unsafelyUnwrapped) level. Find surf guide and get a board that will bring more progress."
        }
      }
    }
    
    /// Called when the alternate button is tapped. This dismisses the alert then runs our alternate action.
    @IBAction func repeatTapped(_ sender: UIButton) {
        // dismiss the alert immediately
        scenePresenter?.presentAddLevel()
    }
    
    /// Called when the OK button was tapped. If we have a coordinator let it decide what should happen; if not, just dismiss the alert.
    @IBAction func dismissTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
