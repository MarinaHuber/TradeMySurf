//
//  AddDateView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 29.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct AddDateView: View {
    @State private var showNext: Bool = false

    var body: some View {
        NavigationStack {
            Text("Add Date")
            Button("next") {
                showNext.toggle()
            }
            .navigationDestination(isPresented: $showNext) {
                TabBarView()
            }
        }
    }
}

#Preview {
    AddDateView()
}
