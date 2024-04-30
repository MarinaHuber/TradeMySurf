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
    @State private var showNext: Bool = false
    
    var body: some View {
        Text("Add Level")
        Button("Add Date") {
            showNext.toggle()
        }
        .fullScreenCover(isPresented: $showNext) {
            AddDateView()
        }
    }
}

#Preview {
    AddLevelView()
}
