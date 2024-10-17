//
//  WelcomeView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//
import Lottie
import SwiftUI

struct WelcomeView: View {
    @State private var isUserHere = false
    @State private var isAnimated = false

    var body: some View {
        VStack() {
            WelcomeAnimateView()
                .offset(y: isAnimated ? -180 : 0)
            WelcomeIntroText()
                .padding(.bottom, 130)
        }
        .onAppear {
            UserDefaults.standard.userWasHere = false
            withAnimation(.easeInOut(duration: 2)) {
                isAnimated = true
            }
        }
        .background(
            Image("welcome")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }

    private func animateViews() {
        withAnimation {
            isUserHere = true
        }
    }
}

struct WelcomeAnimateView: View {
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        ZStack() {
            WelcomeAnimateContentView()
                .zIndex(1)
                .padding(.leading, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3 / 4, height: UIScreen.main.bounds.height * 2 / 4 - 50)
        .background(themeManager.selectedTheme.primaryThemeColor.opacity(0.7))
        .cornerRadius(30)
        .offset(y: 210)
        .padding([.top, .bottom], 90) //to do fix padding to be dynamic
    }
}

struct WelcomeIntroText: View {
    @State private var isUserHere = false
    @EnvironmentObject private var themeManager: ThemeManager
    
    var body: some View {
        VStack(spacing: 0) {
            Group {
                Text("Welcome")
                    .font(themeManager.selectedTheme.largeTitleFont)
                
                Text("Your surf goals in one place")
                    .font(themeManager.selectedTheme.captionTxtFont)
                    .padding(.bottom, 20)
            }
            .foregroundColor(Color.white)
            ButtonAnimateColor(title: "Get started", action: {
                isUserHere.toggle()
            }, isPresented: $isUserHere)
            Spacer()
        }
        .fullScreenCover(isPresented: $isUserHere) {
            AddLevelDateView()
        }
    }
}
struct WelcomeAnimateContentView: View {
    let animationNames = ["clip-board", "air", "coin-wallet"]
    let imageNames = ["boardSurf", "calendar", "sea-splash"]
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {

        HStack(spacing: 0) {
            VStack(spacing: 0) {
                ForEach(Array(zip(animationNames, imageNames)), id: \.0) { animationView, image in
                    ZStack() {
                        LottieView(animation: .named(animationView))
                            .playing(loopMode: .playOnce)
                            .frame(width: 100, height: 100)
                            .zIndex(1)
                        Image(image)
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .frame(width: 80, height: 80)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 40) {
                Group {
                    Text("Recommend surf board according to level")
                    Text("Your surf locations according to level and season")
                    Text("Help with buying a board and price prediction")
                }
                .foregroundColor(.white)
                .font(themeManager.selectedTheme.regularTitleFont)
            }
            .padding(.trailing,30)
            .frame(maxWidth: 190, maxHeight: .infinity) // end of text columns
        }
    }
}

#Preview {
    WelcomeView()
}
