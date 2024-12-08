//
//  SummaryView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 08.12.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    @State private var animationAmount = 0.0
    @State private var selectedDate = UserDefaults.standard.selectedDate
    @State private var selectedLevel = UserDefaults.standard.selectedLevel
    @State private var levels = [Level.beginner.rawValue, Level.beginnerIntermediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue]
    var vm: ViewModel
    @State private var gradient = [Color.red, Color.blue, Color.gray]
    @State private var startPoint = UnitPoint(x: 0, y: 0)
    @State private var endPoint = UnitPoint(x: 0, y: 2)
    @State private var navigateToNext = false

    var body: some View {
            VStack(alignment: .center, spacing: 0) {
                Group {
                    Image(systemName: "checkmark")
                        .font(Font.system(.largeTitle).bold())
                        .padding(.top, 10)
                    Text("When you want to:")
                        .font(Font.system(.subheadline))
                        .padding()
                    Text("\(self.selectedLevel ?? "")")
                        .font(Font.system(.title).bold())
                        .multilineTextAlignment(.center)
                        .lineLimit(4)
                        .padding(10)
                    Text("The key difference for you is to arrive at \(self.selectedLevel ?? "") level surfing. Your surfing start at: \(self.selectedDate?.dateAsString(style: .long) ?? ""), here are your recommended locations and surfboards")
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(10)
                    VStack(spacing: 0) {
                        Text("For carbon footprint reduction use your location and reduce usage of flights.")
                            .multilineTextAlignment(.center)
                            .lineLimit(3)
                            .padding(10)
                        NotificationCard(
                            icon: Image(systemName: "location.circle"),
                            title: "Allow location access",
                            description: "We need \"Always\" location access to: 1) map your route, 2) remind you to create a trip, and 3) suggest places you've visited. Don't worry, we won't drain your battery.",
                            buttonText: "Open phone settings",
                            buttonAction: { print("Open settings tapped") }
                        )
                    }.padding(.horizontal, 16)

                }
                .padding(.horizontal, 20)
                .foregroundColor(.white)
                AlertButtonView(vm: vm)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationDestination(isPresented: $navigateToNext) {
                        MainView()
                    }
            }
            .padding(.vertical, 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.pastelPrimary)
    }

}


struct NotificationCard: View {
    let icon: Image
    let title: String
    let description: String
    let buttonText: String
    let buttonAction: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)

                Text(title)
                    .font(.headline)
            }

            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.trailing)
                .lineLimit(5)

            Button(action: buttonAction) {
                Text(buttonText)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

//
//#Preview {
//    SummaryView()
//}
