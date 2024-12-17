//
//  AlertButtonView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct AlertButtonView: View {
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    navigationPath.append(NavigationOption.welcome)
                }) {
                    Text("Back")
                        .foregroundColor(.red)
                        .padding(.horizontal, 8)
                        .frame(width: 100, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 1)
                        )

                }

                Button(action: {
                    navigationPath.append(NavigationOption.main)
                }) {
                    Text("Match me")
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40) // Define button size
                        .padding(.horizontal, 8)       // Apply padding after defining size
                        .overlay(                      // Overlay with border on top
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 1)
                        )
                }
        }
        .font(themeManager.selectedTheme.bodyTextFont)

    }
}

struct AlertButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AlertButtonView(navigationPath: .constant(NavigationPath()))
    }
}
