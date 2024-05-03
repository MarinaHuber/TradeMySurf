//
//  AddLevelView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 29.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftyPickerPopover

//struct AddLevelView: View {
//    @State private var showNext: Bool = false
//    
//    var body: some View {
//        Text("Add Level")
//        Button("Add Date") {
//            showNext.toggle()
//        }
//        .fullScreenCover(isPresented: $showNext) {
//            AddDateView()
//        }
//    }
//}


struct AddLevelView: View {
    @State private var selectedLevel: String = Level.Beginner.rawValue
    let levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("pastel"), .blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Button("Pick a surf goal") {
                    showPicker()
                }
                .padding()
                .foregroundColor(.indigo)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                Spacer()
            }
        }
        .onAppear {
            withAnimation {
                self.animateView()
            }
        }
    }

    private func animateView() {
            // Add animation code here if needed
    }

    private func showPicker() {
        StringPickerPopover(title: "Pick a surf goal", choices: levels)
            .setSize(width: UIScreen.main.bounds.size.width, height: 200)
            .setRowHeight(60)
            .setSelectedRow(0)
            .setFontSize(17)
            .setPermittedArrowDirections([.up])
            .setDimmedBackgroundView(enabled: true)
            .setOutsideTapDismissing(allowed: false)
//            .setDoneButton(title: "Next", font: .boldSystemFont(ofSize: 17), color: .systemIndigo) { selectedString, _, _  in
//                self.selectedLevel = selectedString
//                UserDefaults.standard.selectedLevel = selectedString
//                    // Call the next action or function here
//            }
//            .appear(originView: pickerView, baseViewController: nil)
    }
}

#Preview {
    AddLevelView()
}

