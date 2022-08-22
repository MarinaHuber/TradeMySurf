//
//  LocationViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 7/1/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit
import MapKit
//UIImage(systemName: "xmark")
class LocationViewController: UIViewController, StoryboardProtocol, MKMapViewDelegate {
    @IBOutlet var gradientViewHidden: UIView!
    @IBOutlet weak var mapView: MKMapView!
    private var queryLocation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGooglePlaces()
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
        _ = mapModel.results.map {
            print("____test1____\($0.name)")
            let annotation = MKPointAnnotation()
            annotation.coordinate =  CLLocationCoordinate2D(latitude: $0.geometry.location.lat, longitude: $0.geometry.location.lng)
            annotation.subtitle = "Subtitle"
            let coordinateRegion = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 6000, longitudinalMeters: 6000)
            mapView.setRegion(coordinateRegion, animated: true)
            mapView?.addAnnotation(annotation)
            
        }
    }

    @IBAction func closeModal(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

    

}
