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
    @State private var navigateToNext = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                ArrowLevelPopoverView(navigateToNext: $navigateToNext)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color("pastelPrimary")
            )
            .navigationDestination(isPresented: $navigateToNext) {
                MainView()
            }
        }
    }
}

struct ArrowLevelPopoverView: View {
    @Binding var navigateToNext: Bool
    @State private var selectedLevel: String = Level.beginner.rawValue
    @State private var isPopoverPresented = true
    @State private var levels = [Level.beginner.rawValue, Level.beginnerIntermediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue]
    @EnvironmentObject private var themeManager: ThemeManager

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
                ZStack {
                    VStack(spacing: 0) {
                        Picker(selection: $selectedLevel, label: EmptyView()) {
                            ForEach(levels, id: \.self) { level in
                                Text(level)
                                    .font(themeManager.selectedTheme.pickerFont)
                                    .lineLimit(2)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .padding(.vertical, 10)
                                    .multilineTextAlignment(.center)
                            }
                        }
                        .pickerStyle(.wheel)
                        .frame(height: 200)
                    }
                    .frame(width: 300, height: 150)
    #warning("create generic done button with these properties in action")
                    HStack {
                        Spacer()
                        Button("Done") {
                            UserDefaults.standard.selectedLevel = selectedLevel
                            isPopoverPresented = false
                            navigateToNext = true
                        }
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .padding(.horizontal, 12)
                        .frame(height: 30)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(4)
                    }
                    .padding(.horizontal, 10)
                    .position(x: 150, y: 20) // Position the HStack at the top
                }
                .presentationCompactAdaptation(.popover)
            }
        }
        .onAppear {
            self.isPopoverPresented = true
        }
    }
}


#Preview {
    AddLevelView()
        .environmentObject(ThemeManager())
}
