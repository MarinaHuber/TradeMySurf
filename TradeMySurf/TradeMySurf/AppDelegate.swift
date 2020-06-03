//
//  AppDelegate.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

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

func applicationDidEnterBackground(_ application: UIApplication) {
    if UserDefaults.standard.userWasHere {
        UserDefaults.standard.userWasHere = true
    }
}

func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    if UserDefaults.standard.userWasHere {
        UserDefaults.standard.userWasHere = true
    }
}
