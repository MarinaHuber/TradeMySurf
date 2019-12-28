
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SurfTripCoordinator: Coordinator {
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]
    private let window: UIWindow

	init(presenter: UINavigationController) {
		self.presenter = presenter
        self.window = UIWindow()
		childCoordinators = []
		presenter.tabBarItem = UITabBarItem(title: "RECOMMENDED", image: nil, selectedImage: nil)
	}

	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
		let viewController: SurfTripViewController = SurfTripViewController.instantiate(from: storyboard)
        viewController.delegate = self
		presenter.pushViewController(viewController, animated: true)
	}
}
     // MARK: - LoadingViewControllerDelegate
extension SurfTripCoordinator : SurfViewControllerDelegate {
    
    //Coordinators should always be classes so we can use ===
    func performBackToRoot() {
        let welcomeCoordinator = WelcomeCoordinator(window: UIWindow(), presenter: UINavigationController(), viewController: UIViewController())
        addChildCoordinator(welcomeCoordinator)
        welcomeCoordinator.start()
        let tab = TabBarMainCoordinator(window: window, tabBarController: UITabBarController())
        removeChildCoordinator(tab)
  }
}
