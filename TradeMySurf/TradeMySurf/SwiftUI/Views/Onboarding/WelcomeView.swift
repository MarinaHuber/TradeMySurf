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
                .edgesIgnoringSafeArea(.all)
        )
    }

    private func animateViews() {
        withAnimation {
            isUserHere = true
        }
    }
}

struct WelcomeAnimateView: View {

    var body: some View {
        ZStack() {
            VStack() {
                //Add ForEach
                    LottieView(animation: .named("clip-board"))
                    .playing(loopMode: .loop)
                    LottieView(animation: .named("air"))
                    .playing(loopMode: .loop)
                    LottieView(animation: .named("coin-wallet"))
                    .playing(loopMode: .loop)
        }
            .scaleEffect(0.4)
            .padding(.leading, -UIScreen.main.bounds.height * 0.2)
            .zIndex(1)
            Rectangle()
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.4)
                .background(.black)
                .opacity(0.2)
                .cornerRadius(15)
                .shadow(radius: 10)
        }
        .offset(y: 200)
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
