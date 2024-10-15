//
//  RecommendedView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//
import SwiftUI

struct RecommendedView: View {
    @State private var selectedLevel = UserDefaults.standard.selectedLevel
    @State private var sections: [TripSection] = []
    @State private var items: [TripSection: [TripItem]] = [:]
    @EnvironmentObject private var themeManager: ThemeManager


    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [.indigo, .indigo, .blue, .teal, .white]),
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()

            VStack {
                CustomNavigationBar(ifMainView: true)
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(sections, id: \.self) { section in
                            sectionView(for: section)
                        }
                    }
                    .toolbarBackground(.hidden, for: .tabBar)
                    .padding()
                }
            }
        }
        .onAppear {
            updateData()
        }
    }

    private func sectionView(for section: TripSection) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            textSection(for: section)

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

    private func textSection(for section: TripSection) -> some View {
        if let tripItems = items[section], !tripItems.isEmpty {
            let selectedItem = tripItems[0] // Select the first item as default

            switch selectedItem {
            case .surfboard(let board, _):
                return AnyView(sectionHeader(for: board.level, subtitle: "Boards"))

            case .surfCountry(let location, _):
                return AnyView(sectionHeader(for: location.beaufortScaleWave, subtitle: "Locations of size of the waves"))

            case .tip(let tip, _):
                return AnyView(sectionHeader(for: tip.goal, subtitle: "Your goal"))
            }
        }
        return AnyView(Text("No items available for this section"))
    }


    private func sectionHeader(for text: String, subtitle: String) -> some View {
        Group {
            Text(text)
                .font(themeManager.selectedTheme.captionTxtFont)
            Text(subtitle)
                .font(.footnote)
        }
        .padding(.horizontal)
        .foregroundColor(Color(.white))
    }


    private func surfboardsSection(items: [TripItem]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    if case let .surfboard(board, _) = item {
                        SurfboardView(item: board)
                    }
                }
            }
        }
    }

    private func locationsSection(items: [TripItem]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(items, id: \.self) { item in
                    if case let .surfCountry(location, _) = item {
                        LocationView(item: location)
                    }
                }
            }
        }
    }

    private func tipsSection(items: [TripItem]) -> some View {
        return VStack(spacing: 10) {
            ForEach(items, id: \.self) { item in
                if case let .tip(tip, _) = item {
                    TipView(tip: tip)
                }
            }
        }
    }

    private func updateData() {
        guard let selectedLevel = selectedLevel else { return }

        let mockService = MockService()
        var newSections: [TripSection] = []
        var newItems: [TripSection: [TripItem]] = [:]
        let pickerString = Level(rawValue: selectedLevel)

        switch pickerString {
        case .beginner:
            newSections = [.surfboardsBeginner, .surfCountrySummer, .tipBeginner]
            newItems[.surfboardsBeginner] = mockService.dataService.surfboardsBeginner.map { TripItem.surfboard($0, .beginner) }
            newItems[.surfCountrySummer] = mockService.dataService.surfCountryBegginer.map { TripItem.surfCountry($0, .beginner) }
            newItems[.tipBeginner] = mockService.dataService.tipBeginner.map { TripItem.tip($0, .beginner) }
        case .beginnerIntermediate:
            newSections = [.surfboardsBeginnerInter, .surfCountryAutumn, .tipBeginnerInter]
            newItems[.surfboardsBeginnerInter] = mockService.dataService.surfboardsBeginnerInter.map { TripItem.surfboard($0, .beginnerIntermediate) }
            newItems[.surfCountryAutumn] = mockService.dataService.surfCountryBI.map { TripItem.surfCountry($0, .beginnerIntermediate) }
            newItems[.tipBeginnerInter] = mockService.dataService.tipBeginnerInter.map { TripItem.tip($0, .beginnerIntermediate) }
        case .intermediate:
            newSections = [.surfboardsIntermediate, .surfCountryWinter, .tipIntermediate]
            newItems[.surfboardsIntermediate] = mockService.dataService.surfboardsIntermediate.map { TripItem.surfboard($0, .intermediate) }
            newItems[.surfCountryWinter] = mockService.dataService.surfCountryInter.map { TripItem.surfCountry($0, .intermediate) }
            newItems[.tipIntermediate] = mockService.dataService.tipIntermediate.map { TripItem.tip($0, .intermediate) }
        case .advanced:
            newSections = [.surfboardsAdvanced, .surfCountrySpring, .tipAdvanced]
            newItems[.surfboardsAdvanced] = mockService.dataService.surfboardsAdvanced.map { TripItem.surfboard($0, .advanced) }
            newItems[.surfCountrySpring] = mockService.dataService.surfCountryAdvanced.map { TripItem.surfCountry($0, .advanced) }
            newItems[.tipAdvanced] = mockService.dataService.tipAdvanced.map { TripItem.tip($0, .advanced) }
        case .areals:
            break
        case .longboarding:
            break
        case .none:
            break
        }

        sections = newSections
        items = newItems
    }

    private func popBack() {
            // Implement navigation back to AddLevelView here
        UserDefaults.standard.userWasHere = false
        selectedLevel = nil
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

