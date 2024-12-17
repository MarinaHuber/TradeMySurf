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
            Group {
                Button(action: {
                    navigationPath.append(NavigationOption.welcome)
                }) {
                    Text("Back")
                        .bold()
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(.red)
                        .frame(width: 100, height: 40)
                        .padding(.horizontal, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.red, lineWidth: 1)
                        )
                }
                
                Button(action: {
                    navigationPath.append(NavigationOption.main)
                }) {
                    Text("Match me")
                        .bold()
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 1)
                        )
                }
            }
        }
    }
}

struct AlertButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AlertButtonView(navigationPath: .constant(NavigationPath()))
    }
}
