//
//  CalculatorView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

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
            Color.white
            .ignoresSafeArea()
            VStack(spacing: 10) {
                CustomNavigationBar(ifMainView: false)
                    // Segmented controls for material, model, gear, and condition
                Picker("Material", selection: $materialIndex) {
                    Text("Material 1").tag(0)
                    Text("Material 2").tag(1)
                    Text("Material 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())

                Picker("Model", selection: $modelIndex) {
                    Text("Model 1").tag(0)
                    Text("Model 2").tag(1)
                    Text("Model 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())

                Picker("Gear", selection: $gearIndex) {
                    Text("Gear 1").tag(0)
                    Text("Gear 2").tag(1)
                    Text("Gear 3").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())

                Slider(value: $productionValue, in: 0...100, step: 1)
                    .onChange(of: productionValue, perform: { value in
                        calculateValue()
                    })

                Picker("Condition", selection: $conditionIndex) {
                    Text("New").tag(0)
                    Text("Used").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())

                    // Labels for hours and valuation
                Text(hoursLabel)
                    .font(.headline)
                    .padding(.top)

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
            .background(
                LinearGradient(gradient: Gradient(colors: [.indigo, .indigo, .blue, .teal, .white]),
                               startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            )
            .onAppear {
                calculateValue()
            }
        }
    }

    private func calculateValue() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        let formattedMileage = formatter.string(for: productionValue) ?? "0"
        hoursLabel = "Hours on water (\(formattedMileage) hours)"

//        if let prediction = try? PriceCalculator.surfBoards.prediction(
//            model: Double(modelIndex),
//            material: Double(materialIndex),
//            gear: Double(gearIndex),
//            production: productionValue,
//            condition: Double(conditionIndex)
//        ) {
//            let clampedValuation = max(10, prediction.price)
//            formatter.numberStyle = .currency
//            valuation = formatter.string(for: clampedValuation) ?? "$0.00"
//        } else {
//            valuation = "Error"
//        }
    }
}

struct PriceCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

