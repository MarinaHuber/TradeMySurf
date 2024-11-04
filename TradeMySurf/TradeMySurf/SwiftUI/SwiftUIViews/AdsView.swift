//
//  AdsView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 03.11.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct PremiumView: View {
    @State private var isPremiumSelected = false

    var body: some View {
        VStack(spacing: 16) {
                // Header Text
            Text("Get more surfboard goodies with Premium")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.green)
                .multilineTextAlignment(.center)

                // Subtitle
            Text("AI combined with surfers analytics to fuel your surf goals.")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

                // Plan Selection Tabs
            HStack {
                Button(action: {
                    isPremiumSelected = false
                }) {
                    Text("Basic")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(isPremiumSelected ? .white : .blue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(isPremiumSelected ? Color.blue.opacity(0.7) : Color.white.opacity(0.3))
                        .cornerRadius(12)
                }

                Button(action: {
                    isPremiumSelected = true
                }) {
                    Text("CURRENT PLAN")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(isPremiumSelected ? .blue : .white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(isPremiumSelected ? Color.white : Color.blue.opacity(0.7))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 24)

                // Premium Plan Features
            VStack(spacing: 8) {
                Text("Premium Plan")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.gray)

                Text("Live analytics prior to surf trip • Season locations and Surf guide • Program guide • Machine learning on surf market")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
            }
            .padding(16)
            .background(Color.green.opacity(0.2))
            .cornerRadius(12)

            Spacer()
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.7)]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .cornerRadius(16)
        .padding()
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
