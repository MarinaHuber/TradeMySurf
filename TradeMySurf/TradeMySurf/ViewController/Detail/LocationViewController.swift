//
//  LocationViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 7/1/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, StoryboardProtocol {
    @IBOutlet var gradientViewHidden: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//https://stackoverflow.com/questions/37753742/how-to-filter-autocomplete-country-in-google-maps-ios-sdk
//let filter = GMSAutocompleteFilter()
//filter.country = "YOURCountryCode"
        
        
//         let standartAppearence = UINavigationBarAppearance()
//         standartAppearence.configureWithDefaultBackground()
//
//         let backButtonAppearence = UIBarButtonItemAppearance()
//         let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
//         backButtonAppearence.normal.titleTextAttributes = titleTextAttributes
//         backButtonAppearence.highlighted.titleTextAttributes = titleTextAttributes
//         standartAppearence.backButtonAppearance = backButtonAppearence
//
//         UINavigationBar.appearance().standardAppearance = standartAppearence
//         UINavigationBar.appearance().compactAppearance = standartAppearence
//         UINavigationBar.appearance().scrollEdgeAppearance = standartAppearence

    }

}
