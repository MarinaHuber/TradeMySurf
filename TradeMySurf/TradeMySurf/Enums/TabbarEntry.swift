//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

enum TabbarEntry: Int, CaseIterable {

    case recommended, prices, guide

    var title: String {

        switch self {

        case .guide: return "Surf guide"
        case .recommended: return "Recommend"
        case .prices: return "Board price"

        }
    }

    var selectedImage: UIImage {

        switch self {

            case .guide: return UIImage(named:"info_active")!
            case .recommended: return UIImage(named:"recommend_active")!
            case .prices: return UIImage(named:"price_active")!

        }
    }

    var image: UIImage {

        switch self {

        case .guide: return UIImage(named:"info_inactive")!
        case .recommended: return UIImage(named:"recommend_inactive")!
        case .prices: return UIImage(named:"price_inactive")!

        }
    }

    var viewController: UIViewController {
        
        let storyboardSurf: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
        let storyboardGuide: UIStoryboard = UIStoryboard(name: Constants.Storyboards.guideViewController, bundle: nil)
        let storyboardPrice: UIStoryboard = UIStoryboard(name: Constants.Storyboards.priceCalculatorViewController, bundle: nil)

        switch self {

        case .guide: return GuideViewController.instantiate(from: storyboardGuide)
        case .recommended: return SurfTripViewController.instantiate(from: storyboardSurf)
        case .prices: return PriceCalculatorViewController.instantiate(from: storyboardPrice)

        }
    }
}
