
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

final class SurfTripCoordinator: Coordinator {
	var coordinator: SurfTripCoordinator?
	internal var presenter: UINavigationController
	internal var childCoordinators: [Coordinator]

	init(presenter: UINavigationController) {
		self.presenter = presenter
		childCoordinators = []
		presenter.tabBarItem = UITabBarItem(title: "RECOMMENDED", image: nil, selectedImage: nil)
	}

	func start() {
		let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
		let viewController: SurfTripViewController = SurfTripViewController.instantiate(from: storyboard)
        //when pushing from welcome rootVC
        presenter.isNavigationBarHidden = true
		presenter.pushViewController(viewController, animated: true)
	}
}
     // MARK: - LoadingViewControllerDelegate
extension SurfTripCoordinator : SurfViewControllerDelegate {
    func tabBarCoordinatorDidDismiss() { }
    //TO DO: https://irace.me/navigation-coordinators
}
