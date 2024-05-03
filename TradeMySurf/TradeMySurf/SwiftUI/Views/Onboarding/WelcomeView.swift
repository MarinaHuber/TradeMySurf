//
//  WelcomeView.swift
//  
//
//  Created by Marina Huber on 16.11.2023..
//
import Lottie
import SwiftUI

//struct WelcomeView: View {
//    @State private var showNext: Bool = false
//
//    var body: some View {
//        Text("Welcome")
//        Button("Start") {
//            showNext.toggle()
//        }
//        .fullScreenCover(isPresented: $showNext) {
//            AddLevelView()
//        }
//    }
//}
//
//#Preview {
//    WelcomeView()
//}

struct WelcomeView: View {
    @State private var isUserHere = false

    var body: some View {
        VStack(spacing: 20) {
            LottieAnimationView(name: "clip-board", speed: 0.9)
            LottieAnimationView(name: "coin-wallet", speed: 0.8)
            LottieAnimationView(name: "air", speed: 0.8)

            Text("Welcome")
                .font(.title)
                .opacity(isUserHere ? 1 : 0)
                .animation(.easeInOut(duration: 4.0), value: isUserHere)

            Text("Introductory Text")
                .font(.headline)
                .opacity(isUserHere ? 1 : 0)
                .animation(.easeInOut(duration: 4.0), value: isUserHere)

            Button(action: openNext) {
                Text("Start")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .opacity(isUserHere ? 1 : 0)
            .animation(.easeInOut(duration: 4.0), value: isUserHere)
        }
        .padding()
        .onAppear {
            UserDefaults.standard.userWasHere = false
            animateViews()
        }
    }

    private func animateViews() {
        withAnimation {
            isUserHere = true
        }
    }

    private func openNext() {
            // Missing handle fullScreen opening the next view
        UserDefaults.standard.userWasHere = true
    }
}

struct LottieAnimationView: UIViewRepresentable {
    let name: String
    let speed: CGFloat

    func makeUIView(context: Context) -> AnimationView {
        let animationView = AnimationView(name: name)
        animationView.animationSpeed = speed
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }

    func updateUIView(_ uiView: AnimationView, context: Context) {}
}

#Preview {
    WelcomeView()
}
