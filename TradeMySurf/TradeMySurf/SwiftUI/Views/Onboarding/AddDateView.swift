//
//  AddDateView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 29.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI
import SwiftyPickerPopover

//struct AddDateView: View {
//    @State private var showNext: Bool = false
//
//    var body: some View {
//        NavigationStack {
//            Text("Add Date")
//            Button("next") {
//                showNext.toggle()
//            }
//            .navigationDestination(isPresented: $showNext) {
//                TabBarView()
//            }
//        }
//    }
//}

struct AddDateView: View {
    @State private var surfingDate = Date()
    @State private var userFinishedOnboarding = UserDefaults.standard.userWasHere

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("pastel"), .blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

                // Your other UI components here

        }
        .onAppear {
            tapDatePopoverPicker()
        }
    }

    private func tapDatePopoverPicker() {
        DatePickerPopover(title: "Pick a surf date")
            .setLocale(identifier: "en_GB_POSIX")
            .setOutsideTapDismissing(allowed: false)
            .setPermittedArrowDirections([.up])
            .setDimmedBackgroundView(enabled: true)
//            .setDoneButton(title: "Done", font: .boldSystemFont(ofSize: 17), color: .systemIndigo) { date in
//                UserDefaults.standard.surfingTime = date
//                    // Call the next action or function here
//            }
//            .appear(originView: pickerViewDate, baseViewController: nil)
    }
}


#Preview {
    AddDateView()
}
