//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

class GuideViewController: UIViewController, StoryboardProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image : UIImage = UIImage(named: "testPng")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        navigationItem.titleView = imageView
    }
}
