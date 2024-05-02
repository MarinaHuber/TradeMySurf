//
//  RootViewApp.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
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

