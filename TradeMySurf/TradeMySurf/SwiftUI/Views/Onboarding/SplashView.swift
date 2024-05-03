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
        VStack() {
            LottieView(animation: .named("loader_animation"))
                .playing(loopMode: .playOnce)
                .scaleEffect(3)
            Text("Copyrights Codable 2024")
                .padding(.bottom, 20)
                .font(.system(size: 11).weight(.light))
        }
        .edgesIgnoringSafeArea(.all)
        .padding(.top , UIScreen.main.bounds.height / 1.5)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.showNext = true
            }
        }
        .animation(.easeInOut(duration: 3.0), value: showNext)
        .fullScreenCover(isPresented: $showNext) {
            WelcomeView()
        }

    }

//    struct LottieSplashView: UIViewRepresentable {
//        let animationName: String
//
//        func updateUIView(_ uiView: Lottie.AnimationView, context: Context) {}
//
//        func makeUIView(context: Context) -> AnimationView {
//            let animationView = AnimationView(name: animationName)
//            animationView.loopMode = .playOnce
//            animationView.contentMode = .scaleAspectFit
//            animationView.play()
//            return animationView
//        }
//    }
}

#Preview {
    SplashView()
}
