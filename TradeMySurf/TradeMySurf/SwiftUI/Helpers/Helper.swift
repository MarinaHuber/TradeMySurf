//
//  Helper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI


// MARK: - Navigation bar
struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var ifRecommendedView: Bool
    @State var showSheetView = false

    var body: some View {
        // Custom navigation bar
        ZStack {
            Image("logo_wave")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                // Overlay the button on the left
            if ifRecommendedView {
                HStack {
                    Button(action: {
                            // Action for back button
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

    private func popBack() {
        UserDefaults.standard.userWasHere = false
        UserDefaults.standard.selectedLevel = nil
    }
}
// MARK: - iOS MeshGradient & LinearGradient Implementation
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
            meshGradientView()
        } else {
            generateFallbackGradient()
        }
    }

    @ViewBuilder
    private func meshGradientView() -> some View {
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

    @ViewBuilder
    private func generateFallbackGradient() -> some View {
        ZStack {
            GradientFallbackView(width: 2, height: 4)
        }
    }
}

struct ColorPalette {
    static let gradientColors: [Color] = [
        Color(red: 0.54, green: 0.17, blue: 0.89),
        Color(red: 0.29, green: 0.00, blue: 0.51),
        Color(red: 0.00, green: 0.00, blue: 0.55),
        Color(red: 0.10, green: 0.10, blue: 0.44),
        Color(red: 1.00, green: 0.42, blue: 0.42),
        Color(red: 1.00, green: 0.55, blue: 0.00),
        Color(red: 1.00, green: 0.27, blue: 0.00),
        Color(red: 1.00, green: 0.41, blue: 0.71),
        Color(red: 0.85, green: 0.44, blue: 0.84)
    ]
}

// MARK: - Fallback gradient for iOS 17 and Below
struct GradientFallbackView: View {
    let width: Int
    let height: Int // Replace with the desired height

    private var gradientPoints: [SIMD2<Float>] {
        var points: [SIMD2<Float>] = []
        for y in 0..<height {
            for x in 0..<width {
                points.append(SIMD2<Float>(Float(x) / Float(width - 1), Float(y) / Float(height - 1)))
            }
        }
        return points
    }

    private var fallbackGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: ColorPalette.gradientColors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                fallbackGradient
                    .ignoresSafeArea()

                    // Optional: Add dynamic shapes for a more "meshy" feel
                ForEach(0..<gradientPoints.count, id: \.self) { index in
                    Circle()
                        .fill(ColorPalette.gradientColors[index % ColorPalette.gradientColors.count])
                        .frame(width: geometry.size.width / CGFloat(width),
                               height: geometry.size.height / CGFloat(height))
                        .position(
                            x: geometry.size.width * CGFloat(gradientPoints[index].x),
                            y: geometry.size.height * CGFloat(gradientPoints[index].y)
                        )
                        .opacity(0.6)
                        .blur(radius: 10)
                }
            }
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

