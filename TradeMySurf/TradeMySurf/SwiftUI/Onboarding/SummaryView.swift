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
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        NavigationStack(path: $navigationModel.navigationPath) {
            VStack(spacing: 0) {
                Group {
                    Text("When you want to:")
                        .font(themeManager.selectedTheme.tabbarFont)
                    Text("\(self.selectedLevel ?? "")")
                        .font(themeManager.selectedTheme.largeTitleFont)
                }
                .padding(.horizontal, 30)
                .frame(maxWidth: .infinity, alignment: .center)
                .multilineTextAlignment(.center)
                
                
                Group {
                    Image(systemName: "checkmark")
                        .font(themeManager.selectedTheme.largeTitleFont)
                        .padding([.top, .bottom], 10)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("The key difference is to start at the right level for your surfing skills. You choose a start date: \(self.selectedDate?.dateAsString(style: .long) ?? "")")
                        .padding([.top, .bottom], 10)
                        .font(themeManager.selectedTheme.regularTitleFont)
                    
                    Text("To cut down on your carbon footprint, try sticking to local spots by allowing your location access.")
                        .padding(.bottom, 20)
                        .font(themeManager.selectedTheme.bodyTextFont)
                    
                    
                    LocationAccessCard(
                        icon: Image(systemName: "location.circle"),
                        title: "Allow location access",
                        description: "We need \"When using app\" location access to: 1) map your nearest surf location, 2) suggest places you can visit.",
                        buttonText: "Open phone settings",
                        buttonAction: {
                            if let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                               UIApplication.shared.canOpenURL(settingsUrl) {
                                UIApplication.shared.open(settingsUrl)
                            }
                        }
                    )
                    .padding(.bottom, 20)
                    
                    
                    Text("Match to see your recommended level:")
                        .padding(.bottom, 20)
                        .font(themeManager.selectedTheme.regularTitleFont)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.horizontal, 30)
                .multilineTextAlignment(.center)
                
                
                AlertButtonView(
                    onMainButtonTap: {
                        navigationModel.navigateTo(.main)
                    },
                    onSecondaryButtonTap: {
                        if navigationModel.canNavigateBack {
                            navigationModel.navigateBack()
                        } else {
                            dismiss()
                        }
                    }
                )
            }
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.pastelPrimary)
            .navigationDestination(for: NavigationOption.self) { navigationOption in
                switch navigationOption {
                case .main:
                    MainView()
                }
            }
        }
    }
}

struct LocationAccessCard: View {
    let icon: Image
    let title: String
    let description: String
    let buttonText: String
    let buttonAction: () -> Void
    @EnvironmentObject private var themeManager: ThemeManager

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
                .font(themeManager.selectedTheme.regularTitleFont)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .lineLimit(5)
                .fixedSize(horizontal: false, vertical: true)
                .padding(2)

            Button(action: buttonAction) {
                Text(buttonText)
                    .font(themeManager.selectedTheme.regularTitleFont)
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
