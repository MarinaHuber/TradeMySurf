//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

enum TabbarEntry: Int, CaseIterable {

    case guide, recommended, prices

    var title: String {

        switch self {

        case .guide: return "About surf"
        case .recommended: return "Recommend"
        case .prices: return "Price compare"

        }
    }

    var selectedImage: UIImage {

        switch self {

            case .guide: return UIImage(named:"info_active") ?? UIImage()
            case .recommended: return UIImage(named:"recommend_active") ?? UIImage()
            case .prices: return UIImage(named:"price_active") ?? UIImage()

        }
    }

    var image: UIImage {

        switch self {

        case .guide: return UIImage(systemName:"info_inactive") ?? UIImage()
        case .recommended: return UIImage(named:"recommend_active") ?? UIImage()
        case .prices: return UIImage(named:"price_active") ?? UIImage()

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
