//
//  AppDelegate.swift
//  TradeMySurf
//
//  Created by Marina Huber on 9/12/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
//import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    func presentFirstViewController() {
        let firstViewController = UIStoryboard(name: .priceCalculator).instantiateInitialViewController() as! PriceCalendarViewController
        let mainStoryboardName = Bundle.main.object(forInfoDictionaryKey: "Main") as! String
        let storyboard: UIStoryboard = UIStoryboard(name: mainStoryboardName, bundle: nil)
        let centerViewController = storyboard.instantiateInitialViewController()!


        // present the Onboarding pager
        // TODO: Only do this when user first time downloaded app
        let onboardingStoryboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let onboardingVC = onboardingStoryboard.instantiateInitialViewController() {
            centerViewController.present(onboardingVC, animated: false, completion: { [weak self] in
				self?.window?.rootViewController?.dismiss(animated: true, completion: nil)
            })
        }
    }

}

