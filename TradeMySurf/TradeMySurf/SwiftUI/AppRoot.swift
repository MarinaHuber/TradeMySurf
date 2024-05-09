//
//  AppRoot.swift
//  Copyright © 2023 Marina Huber. All rights reserved.
//

import SwiftUI
import UIKit

@main
struct RootApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
            WindowGroup {
                RootAppView()
                // -TODO: find wanted font
                    .environment(\.font, Font.custom("AvenirNextCyr-Light.ttf", size: 12))
            }
    }

}
