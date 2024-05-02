//
//  AppDelegate.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        if CommandLine.arguments.contains("--uitesting") {
            // reset your app status for ui testing
        }
		return true
	}
}
