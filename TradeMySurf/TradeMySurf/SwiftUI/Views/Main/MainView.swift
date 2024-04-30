//
//  MainView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State private var showNext: Bool = false

    var body: some View {
        Text("Main View")
        Button("Detail") {
            showNext.toggle()
        }
    }
}
