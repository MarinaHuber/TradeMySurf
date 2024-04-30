//
//  WelcomeView.swift
//  
//
//  Created by Marina Huber on 16.11.2023..
//

import SwiftUI

struct WelcomeView: View {
    @State private var showNext: Bool = false

    var body: some View {
        Text("Welcome")
        Button("Start") {
            showNext.toggle()
        }
        .fullScreenCover(isPresented: $showNext) {
            AddLevelView()
        }
    }
}

#Preview {
    WelcomeView()
}
