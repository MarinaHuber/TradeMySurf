//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit
import SwiftUI

enum TabbarEntry: Int, CaseIterable {

    case guide, recommended, calculator

    var title: String {

        switch self {

        case .guide: return "Surf guide"
        case .recommended: return "Matched"
        case .calculator: return "Equipment"

        }
    }

    var selectedImage: UIImage {

        switch self {

            case .guide: return UIImage(named:"info_tabActive")!
            case .recommended: return UIImage(named:"recommend_tabActive")!
            case .calculator: return UIImage(named:"price_tabActive")!

        }
    }

    var image: UIImage {

        switch self {

        case .guide: return UIImage(named:"info_inactive")!
        case .recommended: return UIImage(named:"recommend_inactive")!
        case .calculator: return UIImage(named:"price_inactive")!

        }
    }

    var viewController: UIViewController {

        let storyboardSurf: UIStoryboard = UIStoryboard(name: Constants.Storyboards.surfTripViewController, bundle: nil)
        let storyboardGuide: UIStoryboard = UIStoryboard(name: Constants.Storyboards.guideViewController, bundle: nil)
        let storyboardPrice: UIStoryboard = UIStoryboard(name: Constants.Storyboards.priceCalculatorViewController, bundle: nil)

        switch self {

        case .guide: return GuideViewController.instantiate(from: storyboardGuide)
        case .recommended: return SurfTripViewController.instantiate(from: storyboardSurf)
        case .calculator: return PriceCalculatorViewController.instantiate(from: storyboardPrice)

        }
    }
}
