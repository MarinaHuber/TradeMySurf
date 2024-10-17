    //
    //  CalculatorView.swift
    //  TradeMySurf
    //
    //  Created by Marina Huber on 30.04.2024..
    //  Copyright © 2024 Marina Huber. All rights reserved.
    //

import CoreML
import Foundation
import SwiftUI


struct CalculatorView: View {
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var materialIndex: Int = 0
    @State private var modelIndex: Int = 0
    @State private var gearIndex: Int = 0
    @State private var productionValue: Double = 0
    @State private var conditionIndex: Int = 0

    @State private var hoursLabel: String = "Hours on water (0-24 hours)"
    @State private var valuation: String = "$0.00" // Placeholder for currency format

    var body: some View {
        ZStack(alignment: .top) {
            MeshGradientView(
                width: 3,
                height: 3,
                colors: gradientColors,
                background: Color(.pastelPrimary))
            ScrollView {
                VStack(spacing: 10) {
                    CustomNavigationBar(ifMainView: false)
                    Text("Consider these options when choosing a board for your enjoinment")
                        .foregroundColor(Color(.white))
                        .padding(.top, 5)
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .multilineTextAlignment(.leading)
                    Group {
                        Text("Maker")

                        Picker("Maker", selection: $modelIndex) {
                            Text("Mass produced").tag(0)
                            Text("Custom").tag(1)
                        }
                        .onChange(of: modelIndex) { _, _ in
                            calculateValue()
                        }
                        Text("Material")

                        Picker(selection: $materialIndex, label: EmptyView()) {
                            Text("Foam").tag(0)
                            Text("Polyester").tag(1)
                            Text("Epoxy").tag(2)
                            Text("Wood").tag(3)
                        }
                        .onChange(of: materialIndex) { _, _ in
                            calculateValue()
                        }
                        Text("Condition")

                        Picker("Condition", selection: $gearIndex) {
                            Text("New").tag(0)
                            Text("Good").tag(1)
                            Text("Poor").tag(2)
                        }
                        .onChange(of: gearIndex) { _, _ in
                            calculateValue()
                        }
                        Text(hoursLabel)

                        Slider(value: $productionValue, in: 0...100, step: 1)
                            .onChange(of: productionValue) { _, _ in
                                calculateValue()
                            }
                        Text("Gear")
                        Picker("Gear", selection: $conditionIndex) {
                            Text("Not included").tag(0)
                            Text("Included").tag(1)
                        }
                        .onChange(of: conditionIndex) { _, _ in
                            calculateValue()
                        }
                    }
                    .padding(.top, 5)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color(.white))
                    .font(themeManager.selectedTheme.captionTxtFont)
                    .pickerStyle(SegmentedPickerStyle())
                }
                Text(valuation)
                    .font(themeManager.selectedTheme.normalBtnTitleFont)
                    .foregroundColor(.white)
                    .padding(.top)
                Text("Average price")
                    .padding(.top, 10)
                    .font(themeManager.selectedTheme.textTitleFont)
                    .foregroundColor(Color.white)
            }
            .onAppear {
                calculateValue()  // need here
            }
        }.toolbarBackground(.hidden, for: .tabBar)
    }

    private func calculateValue() {
        do {
            let configuration = MLModelConfiguration() // You can customize the configuration here
            let model = try Surfs(configuration: configuration)
                // Perform prediction
            let prediction = try model.prediction(
                model: Double(modelIndex),
                material: Double(materialIndex),
                gear: Double(gearIndex),
                production: productionValue,
                condition: Double(conditionIndex)
            )

                // Clamp valuation and format it as currency
            let clampedValuation = max(10, prediction.price)
            let currencyFormatter = NumberFormatter()
            currencyFormatter.numberStyle = .currency
            valuation = currencyFormatter.string(from: NSNumber(value: clampedValuation)) ?? "Error"
        } catch {
            valuation = "Error calculating value."
        }
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
    CalculatorView()
}

