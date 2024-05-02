//
//  SplashView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//
import Lottie
import SwiftUI
import Foundation

struct SplashView: View {
    @State private var showNext: Bool = false

    var body: some View {
        VStack {
            LottieSplashView(animationName: "loader_animation")
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut(duration: 4.0), value: showNext)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
        .padding(.top , UIScreen.main.bounds.height / 1.4)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showNext = true
            }
        }
        .fullScreenCover(isPresented: $showNext) {
            WelcomeView()
        }

    }

    struct LottieSplashView: UIViewRepresentable {
        let animationName: String

        func updateUIView(_ uiView: Lottie.AnimationView, context: Context) {}

        func makeUIView(context: Context) -> AnimationView {
            let animationView = AnimationView(name: animationName)
            animationView.loopMode = .playOnce
            animationView.play()
            return animationView
        }
    }
}

#Preview {
    SplashView()
}
