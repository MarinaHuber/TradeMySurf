//
//  ButtonAnimateColor.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct ButtonAnimateColor: View {
    @State private var gradient = [Color(.pastelPrimary), .blue, Color(.pastelPrimary)]
    @State private var startPoint = UnitPoint(x: 0, y: 0)
    @State private var endPoint = UnitPoint(x: 1, y: 0)
    @State var isUserHere: Bool = false
    @State private var animationProgress: Double = 0.0
    @EnvironmentObject private var themeManager: ThemeManager


    var body: some View {
        Button(action: {
            self.isUserHere.toggle()
        }) {
            Text("Get started")
                .font(themeManager.selectedTheme.textTitleFont)
                .padding()
                .foregroundColor(Color.white)
        }
        .opacity(isUserHere ? 0 : 1)
        .frame(width: 300, height: 40, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .onAppear {
                self.startPoint = UnitPoint(x: 1, y: -1)
                self.endPoint = UnitPoint(x: 2, y: 2)
            }
            .animation(
                .easeOut(duration: 1)
                .repeatForever(autoreverses: true),
                value: animationProgress
            )
        )
        .onAppear {
            animationProgress = 1.0
        }
        .fullScreenCover(isPresented: $isUserHere, content: {
            AddLevelDateView()
        })
    }
}

#Preview {
    ButtonAnimateColor()
}
