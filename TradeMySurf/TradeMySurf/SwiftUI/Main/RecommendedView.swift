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
    @State private var selectedDate = UserDefaults.standard.selectedDate
    @State private var sections: [TripSection] = []
    @State private var items: [TripSection: [TripItem]] = [:]
    @EnvironmentObject private var themeManager: ThemeManager
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .top) {
            MeshGradientView(
                width: 3,
                height: 3,
                colors: gradientColors,
                background: Color(.pastelPrimary)
            )
            
            VStack {
                CustomNavigationBar(ifMainView: true)
                ScrollView {
                    LazyVStack(spacing: 10) {
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
            textHeader(for: section)

            switch section {
            case .surfboardsBeginner, .surfboardsBeginnerInter, .surfboardsIntermediate, .surfboardsAdvanced, .surfboardsAreals, .surfboardsLongboard:
                surfboardsSection(items: items[section] ?? [])
            case .surfCountrySummer, .surfCountryAutumn, .surfCountryWinter, .surfCountrySpring:
                locationsSection(items: items[section] ?? [])
            case .tipBeginner, .tipBeginnerInter, .tipIntermediate, .tipAdvanced, .tipAreals, .tipLongboard:
                tipsSection(items: items[section] ?? [])
            }
        }
    }

    private func textHeader(for section: TripSection) -> some View {
        if let tripItems = items[section], !tripItems.isEmpty {
            let selectedItem = tripItems[0] // Select the first item as default

            switch selectedItem {
            case .surfboard(let board, _):
                return AnyView(sectionHeader(for: board.level, subtitle: "Boards"))

            case .surfCountry(let location, _):
                return AnyView(sectionHeader(for: location.beaufortScaleWave, subtitle: "Locations for your level"))

            case .tip(_, _):
                return AnyView(sectionHeader(for: "\(self.selectedDate?.dateAsString(style: .long) ?? "")", subtitle: "Your date of surf"))
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
       // .padding(.horizontal)
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
        VStack(spacing: 10) {
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
            newSections = [.surfboardsAreals, .surfCountrySpring, .tipAreals]
            newItems[.surfboardsAreals] = mockService.dataService.surfboardsAreals.map { TripItem.surfboard($0, .areals) }
            newItems[.surfCountrySpring] = mockService.dataService.surfCountryAreals.map { TripItem.surfCountry($0, .areals) }
            newItems[.tipAreals] = mockService.dataService.tipAreals.map { TripItem.tip($0, .areals) }
        case .longboarding:
            newSections = [.surfboardsLongboard, .surfCountrySummer, .tipLongboard]
            newItems[.surfboardsLongboard] = mockService.dataService.surfboardsLongboard.map { TripItem.surfboard($0, .longboarding) }
            newItems[.surfCountrySummer] = mockService.dataService.surfCountryLongoard.map { TripItem.surfCountry($0, .longboarding) }
            newItems[.tipLongboard] = mockService.dataService.tipLongboarding.map { TripItem.tip($0, .longboarding) }
        case .none:
            break
        }

        sections = newSections
        items = newItems
    }

    private var gradientColors: [Color] {
        [
            Color(red: 1.00, green: 0.42, blue: 0.42),
            Color(red: 1.00, green: 0.55, blue: 0.00),
            Color(red: 1.00, green: 0.27, blue: 0.00),
            Color(red: 1.00, green: 0.41, blue: 0.71),
            Color(red: 0.85, green: 0.44, blue: 0.84),
            Color(red: 0.54, green: 0.17, blue: 0.89),
            Color(red: 0.29, green: 0.00, blue: 0.51),
            Color(red: 0.00, green: 0.00, blue: 0.55),
            Color(red: 0.10, green: 0.10, blue: 0.44)
        ]
    }
}

#Preview {
    RecommendedView()
}

