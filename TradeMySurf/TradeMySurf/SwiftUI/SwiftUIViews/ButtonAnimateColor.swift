//
//  ButtonAnimateColor.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct ButtonAnimateColor: View {
    let title: String
    let action: () -> Void
    @State private var startPoint = UnitPoint(x: 1, y: -1)
    @State private var endPoint = UnitPoint(x: 2, y: 2)
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        ZStack {
                // Animated Gradient Background
            RoundedRectangle(cornerRadius: 12.0)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.blue, Color(.pastelPrimary), .blue]),
                        startPoint: startPoint,
                        endPoint: endPoint
                    )
                )
                .onAppear {
                        // Start the gradient animation when the view appears
                    startGradientAnimation()
                }

                // Button Content
            Button(action: {
                action()
            }) {
                Text(title)
                    .font(themeManager.selectedTheme.textTitleFont)
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 40)
            }
            .background(Color.clear) // Transparent background to allow gradient to show
            .contentShape(Rectangle()) // Ensure entire area is tappable
        }
        .frame(width: 300, height: 40)
    }

        // Function to start the gradient animation
    private func startGradientAnimation() {
        withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
            startPoint = UnitPoint(x: -0.5, y: 1.5)
            endPoint = UnitPoint(x: 1.5, y: -0.5)
        }
    }
}




#Preview {
    ButtonAnimateColor(title: "Calculate", action: {})
}
