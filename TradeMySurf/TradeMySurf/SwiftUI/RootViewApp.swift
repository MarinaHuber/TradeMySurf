//
//  RootViewApp.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import SwiftUI
//this is like CoordinatorView entry point
public struct RootAppView: View {

        // MARK: Properties
    @State var activeSheet: FullScreenCover?

    public var body: some View {
        NavigationView {
            SplashView()
            /// this is not custom
                .sheet(item: $activeSheet){ item in
                    switch item {
                    case .splash:
                        SplashView()
                    case .welcome, .addLevel, .addDate:
                        WelcomeView()
                    }
                } //: SHEET
        } //: NAV
        .fullScreenCover(isPresented: .constant(true), content: {
            SplashView()
        })
    }
}

#Preview {
    RootAppView()
}

