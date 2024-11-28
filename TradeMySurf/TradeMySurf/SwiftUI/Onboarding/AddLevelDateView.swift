//
//  AddLevelView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 29.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct LineByLineEffect: TextRenderer {
    var elapsedTime: TimeInterval
    var elementDuration: TimeInterval
    var totalDuration: TimeInterval

    var animatableData: Double {
        get { elapsedTime }
        set { elapsedTime = newValue }
    }

    init(elapsedTime: TimeInterval, elementDuration: Double = 0.5, totalDuration: TimeInterval) {
        self.elapsedTime = min(elapsedTime, totalDuration)
        self.elementDuration = min(elementDuration, totalDuration)
        self.totalDuration = totalDuration
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        let delay = elementDelay(count: layout.count)

        for (i, line) in layout.enumerated() {
            let timeOffset = TimeInterval(i) * delay
            let elementTime = max(0, min(elapsedTime - timeOffset, elementDuration))

            var copy = context
            draw(line, at: elementTime, in: &copy)
        }
    }

    var spring: Spring {
        .snappy(duration: elementDuration - 0.05, extraBounce: 0.4)
    }

    func draw(
        _ line: Text.Layout.Line,
        at time: TimeInterval,
        in context: inout GraphicsContext
    ) {
        let progress = time / elementDuration
        let opacity = UnitCurve.easeIn.value(at: 1.4 * progress)
        let blurRadius = line.typographicBounds.rect.height / 16 * UnitCurve.easeIn.value(at: 1 - progress)
        let translationY = spring.value(fromValue: -line.typographicBounds.descent, toValue: 0, initialVelocity: 0, time: time)

        context.opacity = opacity
        context.addFilter(.blur(radius: blurRadius))
        context.translateBy(x: 0, y: translationY)
        context.draw(line, options: .disablesSubpixelQuantization)
    }

    func elementDelay(count: Int) -> TimeInterval {
        let count = TimeInterval(count)
        let remainingTime = totalDuration - count * elementDuration

        let delay = max(remainingTime / (count + 1), (totalDuration - elementDuration) / count)
        return delay
    }
}

extension Text.Layout {
    var flattenedRuns: some RandomAccessCollection<Text.Layout.Run> {
        flatMap { line in
            line
        }
    }

    var flattenedRunSlices: some RandomAccessCollection<Text.Layout.RunSlice> {
        flattenedRuns.flatMap(\.self)
    }
}

struct AddLevelDateView: View {
    @State private var navigateToNext = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ArrowPopoverView(navigateToNext: $navigateToNext)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.pastelPrimary))
            .navigationDestination(isPresented: $navigateToNext) {
                MainView()
            }
        }
    }
}

import SwiftUI

struct AnimatedTextView: View {
    @Binding var isPopoverPresented: Bool
    @State private var showText = false
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 10) {
                // Define the main message as a single variable
            let mainMessage = "To assist you with surf\ntherapy and retreats, choose your\n goal and your travel date\nplease"

                // Base Text view with common modifiers
            let baseTextView = Text(mainMessage)
                .font(themeManager.selectedTheme.textTitleFont)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .opacity(showText ? 1 : 0)

                // Conditional rendering based on iOS version
            if #available(iOS 18, *) {
                    // iOS 18 and above with LineByLineEffect
                baseTextView
                    .textRenderer(LineByLineEffect(
                        elapsedTime: showText ? 4.0 : 0,
                        totalDuration: 4.0
                    ))
            } else {
                    // iOS 17 and below with regular Text
                baseTextView
                    .padding(.top, 30)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 5.0)) {
                showText = true
            }
        }
        .onTapGesture {
            self.isPopoverPresented.toggle()
        }
    }
}


struct ArrowPopoverView: View {
    @Binding var navigateToNext: Bool
    @State private var selectedLevel: String = Level.beginner.rawValue
    @State private var isPopoverPresented = true
    @State private var levels = [Level.beginner.rawValue, Level.beginnerIntermediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue, Level.areals.rawValue, Level.longboarding.rawValue]
    @State private var showDatePicker = false
    @State private var selectedDate = Date()
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack {
            AnimatedTextView(isPopoverPresented: $isPopoverPresented)
                .padding()
                .popover(isPresented: $isPopoverPresented,
                         attachmentAnchor: .point(.top),
                         arrowEdge: .bottom) {
                    ZStack {
                        VStack(spacing: 0) {
                            if showDatePicker {
                                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                                    .datePickerStyle(WheelDatePickerStyle())
                                    .labelsHidden()
                                    .frame(height: 200)
                            } else {
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
                        }
                        .frame(width: 300, height: 150)
                        
                        HStack {
                            Spacer()
                            Button(showDatePicker ? "Finish" : "Done") {
                                if showDatePicker {
                                    UserDefaults.standard.selectedDate = selectedDate
                                    isPopoverPresented = false
                                    navigateToNext = true
                                } else {
                                    UserDefaults.standard.selectedLevel = selectedLevel
                                    showDatePicker = true
                                }
                            }
                            .font(themeManager.selectedTheme.bodyTextFont)
                            .padding(.horizontal, 12)
                            .frame(height: 30)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                        }
                        .padding(.horizontal, 10)
                        .position(x: 150, y: 20) // button position need dynemic size
                    }
                    .presentationCompactAdaptation(.popover)
                }
        }
        .onAppear {
            self.isPopoverPresented = true
        }
    }
}

//#Preview {
//    AddLevelView()
//        .withThemeManager(ThemeManager())
//}
