//
//  RecommendedView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//
import SwiftUI

struct RecommendedView: View {
    @State private var selectedLevel: String?
    @State private var sections: [TripSection] = []
    @State private var items: [TripSection: [TripItem]] = [:]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(sections, id: \.self) { section in
                        sectionView(for: section)
                    }
                }
                .padding()
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.indigo, .indigo, .blue, .teal, .white]),
                               startPoint: .top,
                               endPoint: .bottom)
            )
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo_wave")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: popToRoot) {
                        Image(systemName: "arrow.turn.up.left")
                    }
                }
            }
        }
        .onAppear {
            selectedLevel = UserDefaults.standard.selectedLevel
            updateData()
        }
        .alert(isPresented: Binding<Bool>(
            get: { UserDefaults.standard.userWasHere },
            set: { UserDefaults.standard.userWasHere = $0 }
        )) {
            Alert(
                title: Text("Welcome"),
                message: Text("You've been here before!"),
                primaryButton: .default(Text("OK")) {
                    UserDefaults.standard.userWasHere = false
                },
                secondaryButton: .cancel(Text("Back")) {
                    UserDefaults.standard.userWasHere = false
                        // Implement navigation to AddLevelView here
                }
            )
        }
    }

    private func sectionView(for section: TripSection) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            sectionHeader(for: section)

            switch section {
            case .surfboardsBeginner, .surfboardsBeginnerInter, .surfboardsIntermediate, .surfboardsAdvanced:
                surfboardsSection(items: items[section] ?? [])
            case .surfCountrySummer, .surfCountryAutumn, .surfCountryWinter, .surfCountrySpring:
                locationsSection(items: items[section] ?? [])
            case .tipBeginner, .tipBeginnerInter, .tipIntermediate, .tipAdvanced:
                tipsSection(items: items[section] ?? [])
            }
        }
    }

    private func sectionHeader(for section: TripSection) -> some View {
        Text("section.surfboardsBeginner.rawValue") // fix
            .font(.headline)
            .padding(.horizontal)
    }

    private func surfboardsSection(items: [TripItem]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    if case let .surfboard(board, _) = item {
                        SurfboardView(board: board)
                    }
                }
            }
        }
    }

    private func locationsSection(items: [TripItem]) -> some View {
        VStack(spacing: 10) {
            ForEach(items, id: \.self) { item in
                if case let .surfCountry(location, _) = item {
                    LocationView(location: location)
                }
            }
        }
    }

    private func tipsSection(items: [TripItem]) -> some View {
        VStack(spacing: 10) {
            ForEach(items, id: \.self) { item in
                if case let .tip(tip, _) = item {
                    TipView(tip: tip)
                }
            }
        }
    }

    private func updateData() {
        guard let level = selectedLevel else { return }

        let mockService = MockService()
        var newSections: [TripSection] = []
        var newItems: [TripSection: [TripItem]] = [:]

//        switch level {
//        case .beginner:
//            newSections = [.surfboardsBeginner, .surfCountrySummer, .tipBeginner]
//            newItems[.surfboardsBeginner] = mockService.dataService.surfboardsBeginner.map { TripItem.surfboard($0, .Beginner) }
//            newItems[.surfCountrySummer] = mockService.dataService.surfCountryBegginer.map { TripItem.surfCountry($0, .Beginner) }
//            newItems[.tipBeginner] = mockService.dataService.tipBeginner.map { TripItem.tip($0, .Beginner) }
//        case .beginnerIntermediate:
//            newSections = [.surfboardsBeginnerInter, .surfCountryAutumn, .tipBeginnerInter]
//            newItems[.surfboardsBeginnerInter] = mockService.dataService.surfboardsBeginnerInter.map { TripItem.surfboard($0, .BeginnerIntermediate) }
//            newItems[.surfCountryAutumn] = mockService.dataService.surfCountryBI.map { TripItem.surfCountry($0, .BeginnerIntermediate) }
//            newItems[.tipBeginnerInter] = mockService.dataService.tipBeginnerInter.map { TripItem.tip($0, .BeginnerIntermediate) }
//        case .Intermediate:
//            newSections = [.surfboardsIntermediate, .surfCountryWinter, .tipIntermediate]
//            newItems[.surfboardsIntermediate] = mockService.dataService.surfboardsIntermediate.map { TripItem.surfboard($0, .Intermediate) }
//            newItems[.surfCountryWinter] = mockService.dataService.surfCountryInter.map { TripItem.surfCountry($0, .Intermediate) }
//            newItems[.tipIntermediate] = mockService.dataService.tipIntermediate.map { TripItem.tip($0, .Intermediate) }
//        case .Advanced:
//            newSections = [.surfboardsAdvanced, .surfCountrySpring, .tipAdvanced]
//            newItems[.surfboardsAdvanced] = mockService.dataService.surfboardsAdvanced.map { TripItem.surfboard($0, .Advanced) }
//            newItems[.surfCountrySpring] = mockService.dataService.surfCountryAdvanced.map { TripItem.surfCountry($0, .Advanced) }
//            newItems[.tipAdvanced] = mockService.dataService.tipAdvanced.map { TripItem.tip($0, .Advanced) }
//        case .Areals:
//            break
//        case .Longboarding:
//            break
//        }
//
//        sections = newSections
//        items = newItems
    }

    private func popToRoot() {
            // Implement navigation to AddLevelView here
        UserDefaults.standard.userWasHere = false
        selectedLevel = nil
    }
}

struct SurfboardView: View {
    let board: Surfboard

    var body: some View {
        VStack {
            Image(board.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            Text(board.level)
                .font(.caption)
        }
        .frame(width: 120)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct LocationView: View {
    let location: Surfboard // Assuming Surfboard is used for locations as well

    var body: some View {
        HStack {
            Image(location.imageFlag)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(30)
            VStack(alignment: .leading) {
                Text(location.countryName)
                    .font(.headline)
                Text(location.continentName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct TipView: View {
    let tip: SurfTip

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Your goal: \(tip.goal)")
                .font(.headline)
            Text(tip.description)
                .font(.body)
            if !tip.descriptionLocation.isEmpty {
                Text(tip.descriptionLocation)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}


#Preview {
    RecommendedView()
}

