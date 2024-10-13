//
//  RootViewApp.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

public struct RootAppView: View {

    public var body: some View {
        SplashView()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RootAppView()
}
