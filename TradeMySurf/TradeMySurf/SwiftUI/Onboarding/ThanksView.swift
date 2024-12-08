//
//  ThanksView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 27.11.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct ThanksView: View {
    @State private var isUserHere = false
    @EnvironmentObject private var themeManager: ThemeManager
    var ifOnboardingView: Bool

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Header with profile picture
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("🫧 Thank you! 🫧")
                            .font(themeManager.selectedTheme.largeTitleFont)
                        Text("It’s great having you as a customer.")
                            .font(.system(size: 17))
                            .foregroundColor(.gray)
                    }.padding(.top, 50)
                    Spacer()
                    Image("marina")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .top)

                // Main Text
                Group {
                    Text("I built Surf Curve from the ground up and I really enjoyed it!")
                    Text("I can ensure you: I don’t serve ads, I don’t mine your data, and I protect your privacy.")
                    Text("App is made by surfers for surfers to help anyone safely learn about this extreme sport. Please be aware that many factors combined make surfing not just a recreational activity, but an extreme sport that challenges both physical and mental limits. If you have any questions or need assistance, please don’t hesitate to reach out to me via email at:")
                }
                .font(themeManager.selectedTheme.regularTitleFont)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

                // Email and Social
                HStack {
                    Text("ask@marinahuber.com")
                        .font(themeManager.selectedTheme.pickerFont)
                        .underline()
                    Spacer()
                }
                .padding(.horizontal)

                // Signature
                Group {
                    Text("Marina Huber,")
                        .font(themeManager.selectedTheme.pickerFont)
                    Image("signature") // change to SVG
                        .resizable()
                        .frame(width: 67, height: 27)
                    Text("Maker of Weather Cast & Surf Curve")
                        .font(themeManager.selectedTheme.captionTxtFont)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

                if ifOnboardingView {
                    ButtonAnimateColor(title: "Let's go!", action: {
                        isUserHere.toggle()
                    })
                    .navigationDestination(isPresented: $isUserHere) {
                        WelcomeView()
                    }
                }
            }
            .padding(.vertical)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.pastelSecondary)
        }
    }
}


struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView(ifOnboardingView: true)
    }
}

