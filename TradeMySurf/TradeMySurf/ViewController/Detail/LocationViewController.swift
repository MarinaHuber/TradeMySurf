//
//  LocationViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 7/1/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit
import GoogleMaps

class LocationViewController: UIViewController, StoryboardProtocol, GMSMapViewDelegate {
    @IBOutlet var gradientViewHidden: UIView!
    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 45.557038, longitude: -3.163216, zoom: 7.0) // point the initial location of map
          mapView.camera = camera
          mapView.delegate = self
          mapView.isMyLocationEnabled = true
          mapView.settings.myLocationButton = true
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 43.085665, longitude: -2.163216)
        marker.title = "This is title"
        marker.snippet = "GoogleMap"
        marker.map = mapView
        
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
