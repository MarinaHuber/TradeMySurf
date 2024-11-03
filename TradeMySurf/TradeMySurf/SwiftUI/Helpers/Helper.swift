//
//  Helper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI


enum SheetRoute: Hashable {
    case confirm, location, surfDetail
}

enum FullScreenRoute: Hashable, Identifiable {
    var id: Int {
        hashValue
    }

    case splash, welcome, addLevel, addDate
}

struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var ifMainView: Bool

    var body: some View {
        // Custom navigation bar
        ZStack {
            Image("logo_wave")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                // Overlay the button on the left
            if ifMainView {
                HStack {
                    Button(action: {
                            // Action for back button
                        presentationMode.wrappedValue.dismiss()
                        popBack()
                    }) {
                        Image(systemName: "arrow.turn.up.left")
                            .foregroundColor(.white)
                    }
                    .frame(width: 60)

                    Spacer() // Keeps the button on the left, but no impact on the layout due to ZStack
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 0) // Make sure the button is flush with the edge
    }

    private func popBack() {
        UserDefaults.standard.userWasHere = false
        UserDefaults.standard.selectedLevel = nil
    }
}

struct MeshGradientView: View {
    let width: Int
    let height: Int
    let colors: [Color]
    let background: Color

    private var gradientPoints: [SIMD2<Float>] {
        var points: [SIMD2<Float>] = []
        for y in 0..<height {
            for x in 0..<width {
                points.append(SIMD2<Float>(Float(x) / Float(width - 1), Float(y) / Float(height - 1)))
            }
        }
        return points
    }

    var body: some View {
        if #available(iOS 18, *) {
            iOS18MeshGradientView()
        } else {
            generateFallbackGradient()
        }
    }

    // MARK: - iOS 18+ MeshGradient Implementation
    @ViewBuilder
    private func iOS18MeshGradientView() -> some View {
        if #available(iOS 18, *) {
            MeshGradient(
                width: width,
                height: height,
                locations: .points(gradientPoints),
                colors: .colors(colors),
                background: background,
                smoothsColors: true
            )
            .ignoresSafeArea()
        }
    }

    // MARK: - Fallback plain color for iOS 17 and Below
    @ViewBuilder
    private func generateFallbackGradient() -> some View {
        ZStack {
            background
                .foregroundColor(Color(.pastelPrimary))
                .ignoresSafeArea()
        }
    }
}


    // Define the view modifier for the navigation transition
struct IfAvailableNavigationTransition: ViewModifier {
    var item: Surfboard?
    var transitionId: Namespace.ID

    func body(content: Content) -> some View {
        if #available(iOS 18, *) {
            content.navigationTransition(.zoom(sourceID: item, in: transitionId))
        } else {
            content // Just return the content if the iOS version is below 18
        }
    }
}
