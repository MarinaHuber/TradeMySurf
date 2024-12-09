//
//  SummaryView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 08.12.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    @StateObject private var navigationModel = NavigationModel()
    @State private var animationAmount = 0.0
    @State private var selectedDate = UserDefaults.standard.selectedDate
    @State private var selectedLevel = UserDefaults.standard.selectedLevel
    @State private var levels = [Level.beginner.rawValue, Level.beginnerIntermediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue]
    @State private var gradient = [Color.red, Color.blue, Color.gray]
    @State private var startPoint = UnitPoint(x: 0, y: 0)
    @State private var endPoint = UnitPoint(x: 0, y: 2)
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack(path: $navigationModel.navigationPath) {
            VStack(spacing: 0) {
                Group{
                    Text("When you want to:")
                        .font(Font.system(.subheadline))
                    Text("\(self.selectedLevel ?? "")")
                        .font(Font.system(.title).bold())
                }
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, alignment: .leading)


                Group {
                    Image(systemName: "checkmark")
                        .font(Font.system(.largeTitle).bold())
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity, alignment: .center)

                    Text("The key difference is to arrive at appropriate surfing level. You choose the start date on: \(self.selectedDate?.dateAsString(style: .long) ?? "")")
                        .padding([.top, .bottom], 10)


                    Text("For carbon footprint reduction use your location and reduce usage of flights.")
                        .padding(.bottom, 20)


                    NotificationCard(
                        icon: Image(systemName: "location.circle"),
                        title: "Allow location access",
                        description: "We need \"When using app\" location access to: 1) map your nearest surf location, 2) suggest places you can visit. Don't worry, it won't drain your battery.",
                        buttonText: "Open phone settings",
                        buttonAction: {
                            if let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                               UIApplication.shared.canOpenURL(settingsUrl) {
                                UIApplication.shared.open(settingsUrl)
                            }
                        }
                    )
                    .padding(.bottom, 20)


                    Text("Match to see your recommended locations and surfboards:")
                        .padding(.bottom, 20)
                }
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, alignment: .leading)

                AlertButtonView(navigationPath: $navigationModel.navigationPath)
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.pastelPrimary)
            .navigationDestination(for: NavigationOption.self) { navigationOption in
                switch navigationOption {
                case .main:
                    MainView()
                case .onboarding:
                    WelcomeView()
                }
            }
        }
    }

}


struct NotificationCard: View {
    let icon: Image
    let title: String
    let description: String
    let buttonText: String
    let buttonAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)

                Text(title)
                    .font(.headline)
            }

            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(5)
                .fixedSize(horizontal: false, vertical: true)
                .padding(2)

            Button(action: buttonAction) {
                Text(buttonText)
                    .font(.subheadline)
                    .frame(maxWidth: 150, maxHeight: 30)
                    .padding(6)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.blue, lineWidth: 1)
                    )
            }

        }
        .padding()
        .background(Color.pastelSecondary)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

//
//#Preview {
//    SummaryView()
//}
