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
                .offset(y: isAnimated ? -200 : 0)
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
            HStack(spacing: 0) {
                VStack(spacing: 10) {
                    ForEach(Array(zip(animationNames, imageNames)), id: \.0) { animation, image in
                        ZStack() {
                            LottieView(animation: .named(animation))
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
                VStack(alignment: .leading, spacing: 20) {
                    Group {
                        Text("Recommend surf board according to level")
                        Text("Your surf locations according to level and season")
                        Text("Help with buying a board and price prediction")
                    }
                    .foregroundColor(.white)
                    .font(.subheadline)
                }.padding(.all, 0)
                    .frame(width: 180, height: .infinity)
            }
            .zIndex(1)
            .padding(.leading, 40)
            Rectangle()
                .opacity(0.4)
                .background(Color(UIColor(named: "pastel") ?? .yellow))
                .cornerRadius(15)
                .opacity(0.2)
                .padding(.all, 50)
                .shadow(radius: 10)
        }
        .offset(y: 200)
        .padding(.top, 50)
    }
}

struct WelcomeIntroText: View {
    @State private var isUserHere = false

    var body: some View {
        VStack(spacing: 10) {
            Group {
                Text("Welcome")
                    .font(.title)

                Text("Introductory Text")
                    .font(.headline)

                Button(action: {
                    self.isUserHere.toggle()
                }) {
                    Text("Get started")
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $isUserHere, content: {
                    AddLevelView()
                })
            }
            .foregroundColor(.white)
            .opacity(isUserHere ? 0 : 1)
            .animation(.easeInOut(duration: 4.0), value: isUserHere)
        }
    }
}

//struct LottieAnimationView: UIViewRepresentable {
//    let name: String
//    let speed: CGFloat
//
//    func makeUIView(context: Context) -> some UIView {
//        let view = UIView(frame: .zero)
//
//
//        let lottieAnimationView = LottieAnimationView(name: name, speed: speed)
//
//        lottieAnimationView.animation = animation
//        lottieAnimationView.animationSpeed = speed
//        lottieAnimationView.contentMode = .scaleAspectFill
//        lottieAnimationView.loopMode = .loop
//        lottieAnimationView.play()
//
//        lottieAnimationView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(lottieAnimationView)
//
//        NSLayoutConstraint.activate([
//            view.topAnchor.constraint(equalTo: lottieAnimationView.topAnchor),
//            view.bottomAnchor.constraint(equalTo: lottieAnimationView.bottomAnchor),
//            view.leadingAnchor.constraint(equalTo: lottieAnimationView.leadingAnchor),
//            view.trailingAnchor.constraint(equalTo: lottieAnimationView.trailingAnchor),
//            view.widthAnchor.constraint(equalTo: lottieAnimationView.widthAnchor),
//            view.heightAnchor.constraint(equalTo: lottieAnimationView.heightAnchor),
//        ])
//        return view
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<LottieAnimationView>) {
//    }
//}

#Preview {
    WelcomeView()
}
