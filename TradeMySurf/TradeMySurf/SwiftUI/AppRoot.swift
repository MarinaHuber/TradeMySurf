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
                //Text("Custom font").font(Font.custom("OpenSans-Regular", size: 12.3))
                    .environment(\.font, Font.custom("CustomFont", size: 12))
            }
    }

}
