//
//  Helper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI


enum SheetRoute: Hashable {
    case confirm, location, surfDetail
}

enum FullScreenRoute: Hashable, Identifiable {
    var id: Int {
        hashValue
    }

    case splash, welcome, addLevel, addDate
}

struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    var ifMainView: Bool

    var body: some View {
            // Custom navigation bar
        ZStack {
                // Centered logo
            Image("logo_wave")
                .resizable()
                .scaledToFit()
                .frame(height: 60)
                // Overlay the button on the left
            if ifMainView {
                HStack {
                    Button(action: {
                            // Action for back button
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.turn.up.left")
                            .foregroundColor(.white)
                    }
                    .frame(width: 60)

                    Spacer() // Keeps the button on the left, but no impact on the layout due to ZStack
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 0) // Make sure the button is flush with the edge
    }
}
