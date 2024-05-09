//
//  ButtonAnimate.swift
//  TradeMySurf
//
//  Created by Marina Huber on 09.05.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct ButtonAnimate: View {
    @State private var animationAmount = 1.0
    @State private var gradient = [Color.purple, Color.blue, Color.white]
    @State private var startPoint = UnitPoint(x: 0, y: 0)
    @State private var endPoint = UnitPoint(x: 0, y: 2)
    @Binding var isUserHere: Bool

    var body: some View {
        Button(action: {
            self.isUserHere.toggle()
        }) {
            Text("Get started")
                .font(.headline)
                .padding()
                .foregroundColor(Color.white)
        }
        .opacity(isUserHere ? 0 : 1)
        .frame(width: 300, height: 40, alignment: .center)
        .animation(.easeInOut(duration: 2.0), value: isUserHere)
        .background(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .onAppear {
                self.startPoint = UnitPoint(x: 1, y: -1)
                self.endPoint = UnitPoint(x: 0, y: 1)
            }
            .animation(
                .easeOut
                .repeatForever(autoreverses: false),
                value: animationAmount
            )
        )
        .fullScreenCover(isPresented: $isUserHere, content: {
            AddLevelView()
        })
    }
}

#Preview {
    ButtonAnimate(isUserHere: .constant(true))
}
