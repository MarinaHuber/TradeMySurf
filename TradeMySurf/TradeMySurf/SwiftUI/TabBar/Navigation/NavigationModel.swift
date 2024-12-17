//
//  NavigationModel.swift
//  TradeMySurf
//
//  Created by Marina Huber on 09.12.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//
import SwiftUI
import Foundation

@MainActor
class NavigationModel: ObservableObject {
    @Published var navigationPath = NavigationPath()
}


enum NavigationOption: String, CaseIterable, Hashable {
    case main, welcome
}

// MARK: - Navigation bar
struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var ifRecommendedView: Bool
    @State var showSheetView = false

    var body: some View {
        ZStack {
            Image("logo_wave")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
            if ifRecommendedView {
                HStack {
                // Summary button on left navbar
                    Button(action: {
                // Action back button
                        presentationMode.wrappedValue.dismiss()
                        popBack()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                    }
                    .frame(width: 60)

                    Spacer()
                    Button(action: {
                        showSheetView.toggle()
                    }) {
                        Image(systemName: "info.bubble")
                            .foregroundColor(.white)
                    }
                    .frame(width: 60)
                    .sheet(isPresented: $showSheetView) {
                        ThanksView(ifOnboardingView: false)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 0) // Make sure the button is flush with the edge
    }
//TODO: change to NavigationPath release all the duplicated view in hirerchy
    private func popBack() {
        UserDefaults.standard.userWasHere = false
        UserDefaults.standard.selectedLevel = nil
        UserDefaults.standard.selectedDate = nil
    }
}
