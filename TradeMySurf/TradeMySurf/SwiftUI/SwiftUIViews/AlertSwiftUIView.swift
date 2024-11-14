//
//  AlertSwiftUIView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

class ViewModel {
    var closeAction: () -> Void = {}
    var backAction: () -> Void = {}
}

struct AlertSwiftUIView: View {
    @State private var animationAmount = 0.0
    @State private var selectedDate = UserDefaults.standard.selectedDate
    @State private var selectedLevel = UserDefaults.standard.selectedLevel
    @State private var levels = [Level.beginner.rawValue, Level.beginnerIntermediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue]
    var vm: ViewModel
    @State private var gradient = [Color.red, Color.blue, Color.gray]
    @State private var startPoint = UnitPoint(x: 0, y: 0)
    @State private var endPoint = UnitPoint(x: 0, y: 2)

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                Group {
                    Image(systemName: "checkmark")
                        .font(Font.system(.largeTitle).bold())
                        .padding(.top, 10)
                    Text("You have been matched for:")
                        .font(Font.system(.subheadline))
                        .padding()
                    Text("\(self.selectedLevel ?? "")")
                        .font(Font.system(.title).bold())
                        .multilineTextAlignment(.center)
                        .lineLimit(4)
                        .padding(10)
                    Text("Surfing start: \(self.selectedDate?.dateAsString(style: .long) ?? "")")
                    Text("Surfboards and locations for your level matched")
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(10)
                }
                .foregroundColor(Color.white)
                AlertButtonView(vm: vm)
            }
            .frame(maxWidth: .infinity)
            .background(
                MeshGradientView(
                    width: 3,
                    height: 3,
                    colors: gradientColors,
                    background: Color(.pastelPrimary)
                )
            )
        }
        .frame(width: 300, height: 500, alignment: .center)

    }
    private var gradientColors: [Color] {
        [
            Color(red: 1.00, green: 0.42, blue: 0.42),
            Color(red: 1.00, green: 0.55, blue: 0.00),
            Color(red: 1.00, green: 0.27, blue: 0.00),
            Color(red: 1.00, green: 0.41, blue: 0.71),
            Color(red: 0.85, green: 0.44, blue: 0.84),
            Color(red: 0.54, green: 0.17, blue: 0.89),
            Color(red: 0.29, green: 0.00, blue: 0.51),
            Color(red: 0.00, green: 0.00, blue: 0.55),
            Color(red: 0.10, green: 0.10, blue: 0.44)
        ]
    }
}

#Preview {
    AlertSwiftUIView(vm: ViewModel())
}
