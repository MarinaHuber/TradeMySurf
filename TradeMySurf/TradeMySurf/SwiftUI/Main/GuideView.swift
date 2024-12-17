//
//  GuideView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct GuideView: View {
    @State private var showNext: Bool = false
    @EnvironmentObject private var themeManager: ThemeManager
    let data = [
        ("Is surfing extreme sport?", "Risk and Danger: Surfing involves navigating large waves, which can be unpredictable and powerful. Surfers face risks such as drowning, injury from falls, collisions with the board or other surfers, and encounters with marine life, like jellyfish or sharks.Surfing requires significant physical strength, balance, and stamina.  Surfing has a culture associated with thrill-seeking and adventure."),
        ("How do I use board price feature in the app?", "Nothing is worse than buying a board for an advanced rider and struggling to ride it. You'll end up needing to sell it and buy a board more suited to your need. If you have ever walked into a surf shop, or browsed online, you’ll know that there is more than a couple to choose from. Equipment calculator is Machine learning tool here to help you with variaty of choices you can find and amount of money you need to purchase it."),
        ("What is Beaufort scale measure for wave height?", "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves at the sea. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea and land."),
        ("Where can I find surf videos and apps?", "Great video content is streamed daily at WLC which is the official world surfing league chanel and also has the app version, another one for videos is Nobody Surf. Most used app is MagicSeadweed useful for finding waves, wind and swell. Some other handy apps: Da Surf Engine, Endangered waves (for environmental issues), Dorsal (for shark detection), Surftracker (dokumenting surf sessions), Surfline (weather forecast)."),
        ("What is surfboard volume?", "Volume is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression. Volume is calculated in liters and it takes yout weight and height to do so, check the online calculator and find out your ideal board vloume."),
        ("What is The history of surf?", "Traditionally lenght is something that you get accustom to and is hard to change, tipically there are few of those: longboard, funboard, fish and shortboard but it is really individally different for every surfer out there. Surfers get so consumed on a certain lenght of a board that they are riding instead of focusing on the rails, rockers and concaves of the board shape. These can change a whole loose feeling and performance of the board more than the lenght alone."),
        ("How to read waves?", "“How do I know if the wave is a right or a left”? “How can I know when a wave is going to break”? “What is a closeout”? These are very common questions in surfing. One of the most important aspects of wave reading is being able to identify (and properly name) the different parts of a wave. Lip: The top part of the wave, Shoulder (or “Face”): The part of a wave that has not broken yet, Curl: The advanced “concave” part, White water (or Foam): After the wave breaks, Impact Zone: The spot where the lip crashes down on the flat water, Tube (or Barrel) and Peak: The highest point on a wave, also the first part of the wave that breaks."),
        ("What means trimming down the middle line of the wave?", "Surfers “trim” in order to adjust to the shape of a wave, going slightly higher or lower to surf the wave shoulder with the necessary speed to stay in the optimal position. These small adjustments are made by slightly leaning your body and putting a bit of weight on either your heels or toes, especially over the front foot. Trimming can’t be used to change direction. Fast breaking wave: Trimming, slow breaking waves: Carving.")
    ]
    @State private var expandedIndex: Int? = nil

// MARK: - Header Row
    private var headerRow: some View {
        HStack {
            Text("Learning")
                .multilineTextAlignment(.leading)
                .font(themeManager.selectedTheme.largeTitleFont)
            Spacer()
        }
        .padding(.top)
        .listRowBackground(Color.pastelSecondary)
    }

// MARK: - Rows
    private var rows: some View {
        ForEach(data.indices, id: \.self) { index in
            RowView(
                title: data[index].0,
                description: data[index].1,
                isExpanded: expandedIndex == index
            ) {
                withAnimation {
                    expandedIndex = expandedIndex == index ? nil : index
                }
            }
            .listRowSeparator(.hidden) // Hide separator
            .listRowBackground(Color.pastelSecondary) // Row background color
        }
    }
// MARK: - RowView Component
    private struct RowView: View {
        let title: String
        let description: String
        let isExpanded: Bool
        let onTap: () -> Void

        @EnvironmentObject private var themeManager: ThemeManager

        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(title) // Display title
                        .font(themeManager.selectedTheme.pickerFont)
                    Spacer()

                        // Chevron toggle
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.down")
                        .rotationEffect(.degrees(isExpanded ? 180 : 0))
                        .foregroundColor(.gray)
                }
                .onTapGesture {
                    onTap()
                }

                if isExpanded {
                    Text(description)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .padding(.top, 5)
                }
            }
            .padding(.vertical, 8)
        }
    }

// MARK: - GuideView
    var body: some View {
        ZStack(alignment: .top) {
            MeshGradientView(
                width: 3,
                height: 3,
                colors: ColorPalette.gradientColors,
                background: Color(.pastelPrimary)
            )
            VStack {
                CustomNavigationBar(ifRecommendedView: false)
                List {
                    headerRow
                    rows
                } // List
                .scrollContentBackground(.hidden) // Remove List default background
                .listStyle(.inset) // List style
                .cornerRadius(12)
                .padding(.horizontal, 20)
                .frame(maxHeight: .infinity)
            }// VStack
        }// ZStack
        .toolbarBackground(.hidden, for: .tabBar)
    }
}

#Preview {
    GuideView()
}
