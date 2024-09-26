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
            LinearGradient(gradient: Gradient(colors: [Color("pastelPrimary"), .blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Button("Pick a surf goal") {
                   
                }
                .padding()
                .foregroundColor(.indigo)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                Spacer()
//                    .fullScreenCover(isPresented: $isUserHere, content: {
//                        AddLevelView()
//                    })
            }
        }
        .onAppear {
            withAnimation {

            }
        }
    }
}

#Preview {
    AddLevelView()
}

