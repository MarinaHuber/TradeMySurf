//
//  AddLevelView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 29.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct AddLevelView: View {

    var body: some View {
        VStack(spacing: 20) {

            ArrowLevelPopoverView()
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(
            LinearGradient(gradient:
                            Gradient(colors: [.white, .blue, Color("pastelPrimary")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
    }
}


struct ArrowLevelPopoverView: View {
    @State private var selectedLevel: String = Level.Beginner.rawValue
    @State private var isPopoverPresented = true // Changed to true
    @State private var levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]

    var body: some View {
        VStack {
            Button("Choose your goal") { 
                self.isPopoverPresented.toggle()
            }
            .padding()
            .foregroundColor(.indigo)
            .background(Color.white)
            .cornerRadius(10)
            .popover(isPresented: $isPopoverPresented,
                     attachmentAnchor: .point(.top),
                     arrowEdge: .bottom) {
                VStack() {
                    Text("Select Surf")
                        .padding(.top, 20)
                    Picker(selection: $selectedLevel, label: EmptyView()) { // Changed selection binding
                        ForEach(levels, id: \.self) { level in
                            Text(level)
                                .font(.system(size: 11))
                                .lineLimit(2) // Set number of lines for picker text
                                .fixedSize(horizontal: false, vertical: true) // Allow text to expand vertically
                                .padding(40) // Add vertical spacing between items
                                .multilineTextAlignment(.center) // Center align the text

                        }
                    }
                    .scaleEffect(1.5)
                    .pickerStyle(.wheel)
                    .padding(.bottom, 20)
                    .padding(.top, -50)
                }
                .frame(width: 300, height: 200) // Increased height for better visibility
                .presentationCompactAdaptation(.popover)
            }
        }
        .padding(.top, UIScreen.main.bounds.height * 1/4)
        .onAppear {
            self.isPopoverPresented = true
        }
    }
}


#Preview {
    AddLevelView()
}
