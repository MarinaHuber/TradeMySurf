//
//  DetailsSurfboardView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct DetailsSurfboardView: View {
    var transitionId: Namespace.ID
    @State var item: Surfboard?
    var onClose: () -> Void
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ScrollView {
                    ZStack(alignment: .topLeading) {
                        closeButton
                            .zIndex(1)
                            .padding(.top, 20)

                            // Background image with Info View overlay
                        if let imageName = item?.imageName, !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width)
                                .clipped() // Prevent overflow
                                .ignoresSafeArea(edges: .top)
                                .overlay(
                                    // Board info View positioned above the image
                                    VStack(alignment: .leading, spacing: 5) {
                                        Group {
                                            Text("Board for - \(item?.level ?? "Unknown Level")")
                                                .font(themeManager.selectedTheme.normalBtnTitleFont)
                                            Text("Volume: \(item?.volume ?? "N/A")")
                                            Text("Weight: \(item?.weight ?? 0) kg")
                                        }
                                         .font(themeManager.selectedTheme.regularTitleFont)
                                    }
                                        .padding(15)
                                        .frame(width: geometry.size.width * 0.9)
                                        .background(.pastelSecondary.opacity(0.8))
                                        .cornerRadius(10)
                                        .padding(.top, 90), alignment: .top
                                )
                        }
                        Spacer() 

                    } // End of VStack
                }
                .ignoresSafeArea(edges: .top)

                    // Premium View centered at the bottom
                PremiumView()
                    .frame(width: geometry.size.width * 0.9, height: min(geometry.size.height * 0.5, 300)) // Set max height
                    .padding(.bottom, 30) // Space from the bottom
                    .cornerRadius(16)
                    .shadow(radius: 10) // Optional shadow for floating effect
                    .position(x: geometry.size.width / 2, y: geometry.size.height - (min(geometry.size.height * 0.5, 300) / 2) - 30) // Centered horizontally at the bottom

            }
            .edgesIgnoringSafeArea(.bottom)
            .ifAvailableNavigationTransition(item: item, transitionId: transitionId)
        }
    }


    private var closeButton: some View {
        Button {
            onClose()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .padding(8)
        }
        .buttonStyle(BorderlessButtonStyle())
        .background(Material.thin)
        .clipShape(Circle())
        .frame(width: 50, height: 50)
        .padding()
    }

}

#Preview {
    DetailsSurfboardView(transitionId: Namespace().wrappedValue, onClose: { })
}
