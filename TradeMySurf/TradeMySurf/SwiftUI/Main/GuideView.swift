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
        ("How do I use board price feature in the app?", "Nothing is worse than buying a board for an advanced rider and struggling to ride it. You'll end up needing to sell it and buy a board more suited to your need. If you have ever walked into a surf shop, or browsed online, you’ll know that there is more than a couple to choose from. Equipment calculator is Machine learning tool here to help you with variaty of choices you can find and amount of money you need to purchase it."),
        ("What is Beaufort scale measure for wave height?", "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves at the sea. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea and land."),
        ("Where can I find surf videos and apps?", "Great video content is streamed daily at WLC which is the official world surfing league chanel and also has the app version, another one for videos is Nobody Surf. Most used app is MagicSeadweed useful for finding waves, wind and swell. Some other handy apps: Da Surf Engine, Endangered waves (for environmental issues), Dorsal (for shark detection), Surftracker (dokumenting surf sessions), Surfline (weather forecast)."),
        ("What is surfboard volume?", "Volume is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression. Volume is calculated in liters and it takes yout weight and height to do so, check the online calculator and find out your ideal board vloume."),
        ("What is surfboard lenght?", "Traditionally lenght is something that you get accustom to and is hard to change, tipically there are few of those: longboard, funboard, fish and shortboard but it is really individally different for every surfer out there. Surfers get so consumed on a certain lenght of a board that they are riding instead of focusing on the rails, rockers and concaves of the board shape. These can change a whole loose feeling and performance of the board more than the lenght alone."),
        ("What is Beaufort scale measure for wave height?", "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves at the sea. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea and land."),
        ("How to read waves?", "“How do I know if the wave is a right or a left”? “How can I know when a wave is going to break”? “What is a closeout”? These are very common questions in surfing. One of the most important aspects of wave reading is being able to identify (and properly name) the different parts of a wave. Lip: The top part of the wave, Shoulder (or “Face”): The part of a wave that has not broken yet, Curl: The advanced “concave” part, White water (or Foam): After the wave breaks, Impact Zone: The spot where the lip crashes down on the flat water, Tube (or Barrel) and Peak: The highest point on a wave, also the first part of the wave that breaks."),
        ("What means trimming down the middle line of the wave?", "Surfers “trim” in order to adjust to the shape of a wave, going slightly higher or lower to surf the wave shoulder with the necessary speed to stay in the optimal position. These small adjustments are made by slightly leaning your body and putting a bit of weight on either your heels or toes, especially over the front foot. Trimming can’t be used to change direction. Fast breaking wave: Trimming, slow breaking waves: Carving.")
    ]
    @State private var expandedIndex: Int? = nil


    var body: some View {
        ZStack(alignment: .top) {
            MeshGradientView(
                width: 3,
                height: 3,
                colors: gradientColors,
                background: Color(.pastelPrimary)
            )
            VStack {
                CustomNavigationBar(ifMainView: false)
                List {
                    HStack {
                        Text("Surf FAQ")
                            .multilineTextAlignment(.leading)
                            .font(themeManager.selectedTheme.textTitleFont)
                        Spacer()
                    }
                    .padding(.top)

                    ForEach(data.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(data[index].0) // Display title
                                    .font(themeManager.selectedTheme.pickerFont)
                                Spacer()
                                    // Toggle arrow icon based on expanded state
                                Image(systemName: expandedIndex == index ? "chevron.up" : "chevron.down")
                                    .rotationEffect(.degrees(expandedIndex == index ? 180 : 0))
                                    .foregroundColor(.gray)
                            }
                            .onTapGesture {
                                    // Toggle expansion state
                                withAnimation {
                                    expandedIndex = expandedIndex == index ? nil : index
                                }
                            }
                            if expandedIndex == index {
                                Text(data[index].1)
                                    .font(themeManager.selectedTheme.captionTxtFont)
                                    .foregroundColor(.secondary)
                                    .padding(.top, 5)
                            }
                        }
                        .padding(.vertical, 10)
                        .listRowSeparator(.hidden)
                    }
                }
                .frame(maxHeight: CGFloat(data.count * 65))
                .listStyle(.inset)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()

            }
        }.toolbarBackground(.hidden, for: .tabBar)

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
    GuideView()
}
