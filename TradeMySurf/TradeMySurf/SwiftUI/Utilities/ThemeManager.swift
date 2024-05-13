//
//  ThemeManager.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.05.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI
/**
 Theme Manager
 */
class ThemeManager: ObservableObject {
    @Published var selectedTheme: ThemeProtocol = SurfTheme()

    func setTheme(_ theme: ThemeProtocol) {
        selectedTheme = theme
    }
}
