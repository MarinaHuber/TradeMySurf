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
        center: CLLocationCoordinate2D(latitude: 40.5, longitude: -8.75),
        latitudinalMeters: 1000,
        longitudinalMeters: 1000
    )

    @State private var annotations: [LocationAnnotation] = [] // Array to hold annotation data
    var queryLocation: String
    var transitionId: Namespace.ID
    var onClose: () -> Void
    @State private var selectedAnnotation: LocationAnnotation? = nil

    var body: some View {
        ZStack(alignment: .topTrailing) {
            mapView
        }
        .onAppear {
            fetchGooglePlaces()
        }
        .sheet(item: $selectedAnnotation) { annotation in
            AnnotationDetailView(annotation: annotation)
                .presentationDetents([.fraction(0.2)])
                .presentationDragIndicator(.visible)
        }
        .ifAvailableNavigationTransition(item: item, transitionId: transitionId)
    }    

    private var mapView: some View {
        Map {
            ForEach(annotations) { annotation in
                Annotation(annotation.title, coordinate: annotation.coordinate) {
                    LocationAnnotationView(annotation: annotation)
                        .onTapGesture {
                            selectedAnnotation = annotation
                        }
                }
            }
        }
        .mapStyle(.imagery)
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
        ApiMapsRequest.client.request(.search(matching: "Wave surf pool \(queryLocation)"), model: MapModel.self) { result in
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
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .foregroundColor(.pastelPrimary)

            Text(annotation.title)
                .font(themeManager.selectedTheme.tabbarFont)
                .padding(5)
                .background(.pastelSecondary)
                .cornerRadius(5)
        }
        .padding(5)
        .cornerRadius(10)
        .shadow(radius: 4)
    }
}

    // Detail View for Annotation
struct AnnotationDetailView: View {
    let annotation: LocationAnnotation
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 10) {
            Text("Recommended surf school:")
                .font(themeManager.selectedTheme.pickerFont)
            Text(annotation.title)
                .font(themeManager.selectedTheme.captionTxtFont)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
            Divider()
            Text("Coordinates: \(annotation.coordinate.latitude), \(annotation.coordinate.longitude)")
                .font(themeManager.selectedTheme.tabbarFont)
                .foregroundColor(.pastelPrimary)
        }
        .padding()
    }
}

    // Data model for annotation
struct LocationAnnotation: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}
#Preview {
    DetailsLocationView(queryLocation: "Surf Africa", transitionId: Namespace().wrappedValue, onClose: { })
}

    // Extension for applying the modifier
extension View {
    func ifAvailableNavigationTransition(item: Surfboard?, transitionId: Namespace.ID) -> some View {
        self.modifier(IfAvailableNavigationTransition(item: item, transitionId: transitionId))
    }
}
