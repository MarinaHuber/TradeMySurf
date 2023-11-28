//
//  SplashView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//
import Lottie
import SwiftUI

struct SplashView: View {
    @State private var showNext: Bool = false
    private let timer = Timer.publish(every: 3.0, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            LottieSplashView(animationName: "loader_animation")
        }
        .background(
            Color.clear
                .onReceive(timer) { _ in
                    withAnimation(.easeIn(duration: 2.5)) {
                        if !UserDefaults.standard.userWasHere {
                            showNext = true
                        } else {

                        }
                    }

                }
        )
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .padding(.top , UIScreen.main.bounds.height / 1.4)
    }

    struct LottieSplashView: UIViewRepresentable {
        let animationName: String

        func updateUIView(_ uiView: Lottie.AnimationView, context: Context) {}

        func makeUIView(context: Context) -> AnimationView {
            let animationView = AnimationView(name: animationName)
            animationView.loopMode = .loop
            animationView.play()
            return animationView
        }
    }
}

#Preview {
    SplashView()
}
