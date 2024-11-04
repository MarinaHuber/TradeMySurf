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
                .padding(.top, 20)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

                // Subtitle
            Text("AI combined with surfers analytics to fuel your surf goals.")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .fixedSize(horizontal: false, vertical: true)

                // Plan Selection Tabs
            HStack {
                Button(action: {
                }) {
                    Text("Basic")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(12)
                }

                Button(action: {
                }) {
                    Text("CURRENT PLAN")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 24)

            VStack(spacing: 8) {
                Text("Premium Plan")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)

                Text("Live analytics prior to surf trip • Season locations and Surf guide • Program guide • Machine learning on surf market")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .fixedSize(horizontal: false, vertical: true)

            }
            .padding(.bottom, 10)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(12)

            Spacer()
        }
        .padding(.horizontal, 20)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.7)]),
                           startPoint: .top,
                           endPoint: .bottom)
        )
        .cornerRadius(16)
    }
}

struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
