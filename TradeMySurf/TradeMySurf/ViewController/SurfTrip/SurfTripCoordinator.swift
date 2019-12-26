
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SurfTripCoordinator: Coordinator {
	var coordinator: TabBarCoordinator?
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
       // presenter.setNavigationBarHidden(true, animated: true)
		childCoordinators = []
		presenter.tabBarItem = UITabBarItem(title: "RECOMMENDED", image: nil, selectedImage: nil)
	}

	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
		let viewController: SurfTripViewController = SurfTripViewController.instantiate(from: storyboard)
		presenter.pushViewController(viewController, animated: true)
	}
}
     // MARK: - LoadingViewControllerDelegate
extension SurfTripCoordinator : SurfViewControllerDelegate {
    //Coordinators should always be classes so we can use ===
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
//   func tabBarCoordinatorDidDismiss() {
//        removeChildCoordinator(coordinator!)
//    }
    //TO DO: https://irace.me/navigation-coordinators
    //view.window?.rootViewController?.dismiss(animated: true, completion: nil)
}
