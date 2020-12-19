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
//            marker.position = CLLocationCoordinate2D(latitude: $0.geometry.location.lat, longitude: $0.geometry.location.lng)
            let camera = GMSCameraPosition.camera(withLatitude: $0.geometry.location.lat, longitude: $0.geometry.location.lng, zoom: 10.0)

            mapView.camera = camera
            marker.title = $0.name
            marker.snippet = "Surf stuff"
            marker.opacity = 0.7
            marker.map = mapView
            marker.icon = UIImage(named: "logo_wave")
            marker.iconView?.sizeThatFits(CGSize(width: 40, height: 40))
            marker.appearAnimation = .pop
            
        }
        
    }
    
    //TODO:  infoWindow custom here
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
       return UIView()
    }
    
}
