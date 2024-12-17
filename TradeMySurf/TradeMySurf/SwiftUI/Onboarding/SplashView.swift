//
//  SplashView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//
import Lottie
import SwiftUI
import Foundation

struct SplashView: View {
    @State private var showNext: Bool = false

    var body: some View {
        VStack() {
            LottieView(animation: .named("loader_animation"))
                .playing(loopMode: .playOnce)
                .scaleEffect(3)
                .padding(.top , UIScreen.main.bounds.height / 1.5)
            Text("Copyrights Codable 2025")
                .padding(.bottom, 20)
                .font(.system(size: 11).weight(.light))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showNext = true
            }
        }
        .background(.pastelSecondary)
        .animation(.easeInOut(duration: 3.0), value: showNext)
        .fullScreenCover(isPresented: $showNext) {
            ThanksView(ifOnboardingView: true)
        }
    }
}

#Preview {
    SplashView()
}
