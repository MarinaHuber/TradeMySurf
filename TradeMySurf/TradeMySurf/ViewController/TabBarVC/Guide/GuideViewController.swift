//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit
import SafariServices

class GuideViewController: UIViewController, StoryboardProtocol, SFSafariViewControllerDelegate {
    @IBOutlet var goToWeb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image : UIImage = UIImage(named: "logo_wave")!
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        navigationItem.titleView = imageView
        goToWeb.attributedText = NSAttributedString(string: "Go to volume calculator", attributes:
        [.underlineStyle: NSUnderlineStyle.single.rawValue])
        goToWeb.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.openWeb(_:)))
        goToWeb.addGestureRecognizer(tap)

    }
    
    @objc private func openWeb(_ sender: UITapGestureRecognizer) {
        if let url = URL(string: "https://firewiresurfboards.com/surfboard-volume-calculator") {
            let vc: SFSafariViewController

            if #available(iOS 11.0, *) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = false
                vc = SFSafariViewController(url: url, configuration: config)
            } else {
                vc = SFSafariViewController(url: url, entersReaderIfAvailable: false)
            }
            vc.delegate = self
            present(vc, animated: true)
        }
        
    }
        
        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            dismiss(animated: true)
        }
    
}

