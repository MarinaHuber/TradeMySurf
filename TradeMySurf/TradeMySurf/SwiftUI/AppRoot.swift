//
//  AppRoot.swift
//  TradeMySurf
//
//  Created by Marina Huber on 16.11.2023..
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import SwiftUI

@main 
struct RootApp: App {

        // MARK: Properties not used
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            RootAppView() // instantiates app point of single entry
        }
            .onChange(of: scenePhase) { value in
                switch value {
                case .active, .inactive: break
                case .background: break
                @unknown default: break
                }
            }
    }

}
