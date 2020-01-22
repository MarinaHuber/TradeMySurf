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
    @IBOutlet var alternateButton: UIButton!
    let selectedDate = UserDefaults.standard.surfingTime
    let selectedLevel = UserDefaults.standard.selectedLevel
    
    // MARK: Managing the View
    
    override func viewDidLoad() {
        titleLabel.text = "Your goal is set: \(selectedLevel ?? "")"
        bodyLabel.text = "You will surf starting:  \(selectedDate?.dateAsString(style: .long) ?? "")"
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
