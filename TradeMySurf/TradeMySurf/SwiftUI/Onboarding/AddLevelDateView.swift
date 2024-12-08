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
    var viewModel: ViewModel?

    var body: some View {
      //  NavigationStack {
            VStack(spacing: 0) {
                ArrowPopoverView(navigateToNext: $navigateToNext)
            }
            .edgesIgnoringSafeArea(.all)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.pastelPrimary))
            .fullScreenCover(isPresented: $navigateToNext) {
                SummaryView(vm: viewModel ?? ViewModel())
            }
//Move this to SummryView
//            .navigationDestination(isPresented: $navigateToNext) {
//                //MainView()
//            }
//        }
    }
}

import SwiftUI

struct AnimatedTextView: View {
    @State private var showText = false
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        VStack(spacing: 10) {
                // Define the main message as a single variable
            let mainMessage = "To assist you with surf\ntherapy and retreats, choose your\n goal and your travel date\nplease"

            let baseTextView = Text(mainMessage)
                .font(themeManager.selectedTheme.textTitleFont)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .opacity(showText ? 1 : 0)

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
            withAnimation(.easeInOut(duration: 2.0)) {
                showText = true
            }
        }
    }
}


struct ArrowPopoverView: View {
    @Binding var navigateToNext: Bool
    @State var level: String = Level.beginner.rawValue
    @State private var showDatePicker = false
    @State var date = Date()
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var showPopover = false
    @State var showButton: Bool = false

    var body: some View {
        VStack(spacing: 16) {
            PickerPopoverView(selectedLevel: $level, selectedDate: $date, showDatePicker: showDatePicker) // TODO- Add viewModel @ObservableObject instead
                .opacity(showPopover ? 1 : 0)

            AnimatedTextView()
                .padding(.top, 10)

            ButtonAnimateColor(title: showDatePicker ? "Done" : "Let's go", action: {
                if showDatePicker {
                    UserDefaults.standard.selectedDate = date
                    navigateToNext = true
                } else {
                    showDatePicker = true
                    UserDefaults.standard.selectedLevel = level
                }
            })
            .font(themeManager.selectedTheme.bodyTextFont)
            .frame(width: 300, height: 40, alignment: .center)
            .padding([.horizontal, .top]) // Add some spacing at the bottom
            .opacity(showButton ? 1 : 0)


            Spacer()
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 4.0)) {
                showPopover = true
            }
        }
        .onChange(of: level, {
            showButton = true
        })

    }
}

struct PickerPopoverView: View {
    @Binding var selectedLevel: String
    @Binding var selectedDate: Date
    var showDatePicker = false
    @EnvironmentObject private var themeManager: ThemeManager
    @State private var levels = [Level.beginner.rawValue, Level.beginnerIntermediate.rawValue, Level.intermediate.rawValue, Level.advanced.rawValue, Level.areals.rawValue, Level.longboarding.rawValue]

    var body: some View {
        VStack(spacing: 0) {

            VStack(spacing: 0) {
                if showDatePicker {
                    DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .pickerStyle(.wheel)
                } else {
                    Picker(selection: $selectedLevel, label: EmptyView()) {
                        ForEach(levels, id: \.self) { level in
                            Text(level)
                                .font(themeManager.selectedTheme.pickerFont)
                                .lineLimit(2)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .pickerStyle(.wheel)
                }
            }
            .background(.pastelSecondary)
            .cornerRadius(12)
            .frame(width: 300)
            .offset(y: 2)
            .zIndex(1)

            Image(systemName: "arrowtriangle.down.fill") // arrow
                .foregroundColor(.pastelSecondary)
        }
        .compositingGroup()
        .shadow(color: .black.opacity(0.4), radius: 30)
        .padding(.top, UIScreen.main.bounds.height / 4)

    }
}

//#Preview {
//    AddLevelView()
//        .withThemeManager(ThemeManager())
//}
