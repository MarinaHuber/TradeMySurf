//
//  AppDelegate.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private var coordinator: Coordinator? = nil
    var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if CommandLine.arguments.contains("--uitesting") {
            // reset your app status for ui testing
        }
        
    // MARK: Configure Coordinator without storyboard
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { fatalError() }
        coordinator = Coordinator(window: window)
        window.makeKeyAndVisible()
        scenePresenter?.presentSplash()
    
        customizeNavBar()
        [GMSServices .provideAPIKey("AIzaSyCzsrbKVIQ0f_5O53U6D2bTzgmuxlQ89j4")]
		return true
	}
    override var next: UIResponder? {
        return coordinator
    }

    
    func customizeNavBar () {
        guard let navigationController = self.window?.rootViewController as? UINavigationController else { return }
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}
