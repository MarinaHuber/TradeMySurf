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
    @State private var materialIndex: Int = 0
    @State private var modelIndex: Int = 0
    @State private var gearIndex: Int = 0
    @State private var productionValue: Double = 0
    @State private var conditionIndex: Int = 0

    @State private var hoursLabel: String = "Hours on water (0 hours)"
    @State private var valuation: String = "$0.00" // Placeholder for currency format

    var body: some View {
        ZStack(alignment: .top) {
            MeshGradientView(
                width: 3,
                height: 3,
                colors: gradientColors,
                background: Color(.pastelPrimary))

            VStack(spacing: 0) {
                CustomNavigationBar(ifMainView: false)
                Text("Consider these options when gettig a board for your development and fun")
                    .padding(.top, 5)
                    .multilineTextAlignment(.center)
                    .frame(height: 70)// Align text to the left
                    // Segmented controls for material, model, gear, and condition
                Group {
                    Text("Maker")
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Maker", selection: $modelIndex) {
                        Text("Mass produced").tag(0)
                        Text("Custom").tag(1)
                    }
                    .onChange(of: modelIndex) { _, _ in
                        calculateValue()
                    }
                    Text("Material")
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Material", selection: $materialIndex) {
                        Text("Foam").tag(0)
                        Text("Polyester").tag(1)
                        Text("Epoxy").tag(2)
                        Text("Wood").tag(3)
                    }
                    .onChange(of: materialIndex) { _, _ in
                        calculateValue()
                    }
                    Text("Condition")
                        .padding(.top, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Condition", selection: $gearIndex) {
                        Text("New").tag(0)
                        Text("Good").tag(1)
                        Text("Poor").tag(2)
                    }
                    .onChange(of: gearIndex) { _, _ in
                        calculateValue()
                    }
                }
                .padding(.top, 5)
                .pickerStyle(SegmentedPickerStyle())

                Text(hoursLabel)
                    .font(.headline)
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Slider(value: $productionValue, in: 0...100, step: 1)
                    .onChange(of: productionValue) { _, _ in
                        calculateValue()
                    }
                Text("Gear").padding()
                Picker("Gear", selection: $conditionIndex) {
                    Text("Not included").tag(0)
                    Text("Included").tag(1)
                }
                .onChange(of: conditionIndex) { _, _ in
                    calculateValue()
                }
                .pickerStyle(SegmentedPickerStyle())

                Text(valuation)
                    .font(.largeTitle)
                    .padding(.top)

                    // Calculate button
                Button("Calculate") {
                    calculateValue()
                }
                .padding()
            }
            .padding()
            .onAppear {
                calculateValue()
            }
        }
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

    //struct PriceCalculatorView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        CalculatorView(surboards: )
    //    }
    //}

