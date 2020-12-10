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
    private var queryLocation: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGooglePlaces()
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
    }
    func fetchGooglePlaces() {
        ApiMapsRequest.client.request(.search(matching: "Surf Morocco"), model: MapModel.self) { result in
            switch result {
                case .success(let location):
                    DispatchQueue.main.async {
                        self.showGooglePlaces(location)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    func showGooglePlaces(_ mapModel: MapModel) {
        let markers = mapModel.results.map {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: $0.geometry.location.lat, longitude: $0.geometry.location.lng)
            marker.title = $0.name
            marker.snippet = "Surf stuff"
            marker.map = mapView
            
        }
        
    }
    
    
    
}
