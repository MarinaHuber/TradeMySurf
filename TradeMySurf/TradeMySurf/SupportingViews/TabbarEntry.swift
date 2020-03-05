//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

enum TabbarEntry: Int, CaseIterable {

    case recommended, prices, guide

    var title: String {

        switch self {

        case .recommended: return "Recommended"
        case .prices: return "Price compare"
        case .guide: return "About surf"

        }
    }

    var selectedImage: UIImage {

        switch self {

            case .recommended: return UIImage(named:"") ?? UIImage()
            case .prices: return UIImage(named:"") ?? UIImage()
            case .guide: return UIImage(named:"") ?? UIImage()

        }
    }

    var image: UIImage {

        switch self {

        case .recommended: return UIImage(named:"map") ?? UIImage() // placeholder
        case .prices: return UIImage(named:"surf") ?? UIImage()
        case .guide: return UIImage(systemName:"info") ?? UIImage()

        }
    }

    var viewController: UIViewController {
        
        let storyboardSurf: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
        let storyboardGuide: UIStoryboard = UIStoryboard(name: Constants.Storyboards.guideViewController, bundle: nil)
        let storyboardPrice: UIStoryboard = UIStoryboard(name: Constants.Storyboards.priceCalculatorViewController, bundle: nil)

        switch self {

        case .recommended: return SurfTripViewController.instantiate(from: storyboardSurf)
        case .prices: return PriceCalculatorViewController.instantiate(from: storyboardPrice)
        case .guide: return GuideViewController.instantiate(from: storyboardGuide)

        }
    }
}
