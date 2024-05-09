    //
    //  WelcomeView.swift
    //
    //
    //  Created by Marina Huber on 16.11.2023..
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
                .padding(.bottom, 30)
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
    let animationNames = ["clip-board", "coin-wallet", "air"]
    let imageNames = ["boardSurf", "calendar", "sea-splash"]

    var body: some View {
        ZStack() {
            Color(UIColor(named: "pastel") ?? .yellow)
                .opacity(0.3) 
                .cornerRadius(15)
                .padding(.all, 50)
                .shadow(radius: 10)
                .ignoresSafeArea()
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
                    .font(.subheadline)
                }
                .padding(.trailing,30)
                .frame(width: 190, height: .infinity) // end of text columns
            }
            .zIndex(1)
            .padding(.leading, 30)
        }
        .offset(y: 200)
        .padding([.top, .bottom], 50)
    }
}

struct WelcomeIntroText: View {
    @State private var isUserHere = false

    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("Welcome")
                    .font(.title)

                Text("Introductory Text")
                    .font(.headline)
            }
            .foregroundColor(Color.white)
                ButtonAnimate(isUserHere: $isUserHere)
        }
    }
}

#Preview {
    WelcomeView()
}
