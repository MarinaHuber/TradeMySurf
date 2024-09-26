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

            ArrowPopoverViews()
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


struct ArrowPopoverViews: View {
    @State private var selectedLevel: String = Level.Beginner.rawValue

    @State private var isPopoverPresented = false
    @State private var isPopoverPresented1 = true

    @State private var levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]

    var body: some View {
        Button("Choose your goal") { self.isPopoverPresented.toggle() }
            .padding()
            .foregroundColor(.indigo)
            .background(Color.white)
            .cornerRadius(10)
            //  .frame(minWidth: 200, maxHeight: 200)

            .popover(isPresented: $isPopoverPresented,
                     attachmentAnchor: .point(.bottom),
                     arrowEdge: .top) {
                VStack { // just example
                    Text("Surf").padding(.top)
                    Picker("Pick a surf goal", selection: $levels) {
                        ForEach(levels, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.wheel)
                    }
                }
                .frame(width:300, height:300)
                .presentationCompactAdaptation(.popover) // if you also want a popover on iPhones
                .onAppear{
                    print("popover show")
                }
            }
                     .padding(.top, UIScreen.main.bounds.height * 1/4)

        Button("Choose your date") { self.isPopoverPresented1.toggle() }
            .padding()
            .foregroundColor(.indigo)
            .background(Color.white)
            .cornerRadius(10)
            //  .frame(minWidth: 200, maxHeight: 200)

            .popover(isPresented: $isPopoverPresented1,
                     attachmentAnchor: .point(.bottom),
                     arrowEdge: .top) {
                VStack { // just example
                    Text("Surf").padding(.top)
                    Picker("Pick a date", selection: $levels) {
                        ForEach(levels, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.wheel)
                    }
                }
                .frame(width:300, height:300)
                .presentationCompactAdaptation(.popover) // if you also want a popover on iPhones
                .onAppear{
                    print("popover show")
                }
            }
                     .padding(.bottom, UIScreen.main.bounds.height * 1/4)
    }
}


#Preview {
    AddLevelView()
}
