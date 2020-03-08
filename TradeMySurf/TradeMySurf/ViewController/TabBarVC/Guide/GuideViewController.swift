//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

class GuideViewController: UIViewController, StoryboardProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image : UIImage = UIImage(named: "logo_wave")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        navigationItem.titleView = imageView
    }
}
