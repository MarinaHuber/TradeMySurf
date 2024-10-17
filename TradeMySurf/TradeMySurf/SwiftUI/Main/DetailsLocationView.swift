//
//  DetailsLocationView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//
import MapKit
import SwiftUI

struct DetailsLocationView: View {
    @State var item: Surfboard?
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 31.5, longitude: -9.75), // Example starting location (Morocco)
        latitudinalMeters: 6000,
        longitudinalMeters: 6000
    )

    @State private var annotations: [LocationAnnotation] = [] // Array to hold annotation data
    var queryLocation: String
    var transitionId: Namespace.ID
    var onClose: () -> Void

    var body: some View {
        ZStack(alignment: .topTrailing) {
                // Refactored Map component
            mapView
        }
        .onAppear {
            fetchGooglePlaces() // Fetch the places when the view appears
        }
        .navigationTransition(.zoom(sourceID: item, in: transitionId))
    }

    private var mapView: some View {
        Map {
            UserAnnotation()
            ForEach(annotations) { annotation in
                Annotation(annotation.title, coordinate: annotation.coordinate) {
                    LocationAnnotationView(annotation: annotation)
                }
            }
        }
        .mapStyle(.standard)
        .mapControls {
            MapUserLocationButton()
        }
        .overlay(alignment: .topLeading) {
            HStack {
                closeButton
                Spacer()
            }
            .padding(.top, 16)
            .padding(.leading, 16)
            .safeAreaInset(edge: .top) {
                Spacer()
                    .frame(height: 20) // Add some extra top space
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    private var closeButton: some View {
        Button {
            onClose()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .padding(8)
        }
        .buttonStyle(BorderlessButtonStyle())
        .background(Material.thick)
        .clipShape(Circle())
        .frame(width: 50, height: 50)
        .padding()
    }

    func fetchGooglePlaces() {
        ApiMapsRequest.client.request(.search(matching: "Surf \(queryLocation)"), model: MapModel.self) { result in
            switch result {
            case .success(let mapModel):
                DispatchQueue.main.async {
                    showGooglePlaces(mapModel)
                }
            case .failure(let error):
                print("Error fetching places: \(error)")
            }
        }
    }

    func showGooglePlaces(_ mapModel: MapModel) {
        annotations = mapModel.results.map { result in
            LocationAnnotation(
                title: result.name,
                coordinate: CLLocationCoordinate2D(latitude: result.geometry.location.lat, longitude: result.geometry.location.lng)
            )
        }

            // Optionally set the region to the first annotation's location
        if let firstLocation = mapModel.results.first {
            region.center = CLLocationCoordinate2D(latitude: firstLocation.geometry.location.lat, longitude: firstLocation.geometry.location.lng)
        }
    }
}

    // Custom annotation view
struct LocationAnnotationView: View {
    let annotation: LocationAnnotation

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
            Text(annotation.title)
                .font(.caption)
                .padding(5)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(radius: 2)
        }
        .padding(5)
        .background(Color.white.opacity(0.8))
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

    // Data model for annotation
struct LocationAnnotation: Identifiable {
    let id = UUID() // Unique identifier for each annotation
    let title: String
    let coordinate: CLLocationCoordinate2D
}
