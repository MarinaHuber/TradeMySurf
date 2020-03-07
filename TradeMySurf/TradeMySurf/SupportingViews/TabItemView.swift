//
//  TabItemView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 3/4/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import UIKit

class TabItemView: UIView {

    // MARK: - Outlets
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!
    
    var contentView: UIView!
    
    let padding: CGFloat = 0

    
    // MARK: - Properties
    private var tabbarEntry: TabbarEntry?

    internal var isSelected: Bool = false {

        didSet {

            self.setSelected(self.isSelected)
        }
    }
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
         self.commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit() {
        self.backgroundColor = .clear
        self.configureIconView()
        self.textLabel.textColor = .white
        self.textLabel.font = UIFont.boldSystemFont(ofSize: 11)
        self.textLabel.isHidden = true
        self.textLabel.text = nil
            
    }

    // MARK: - Configuration
    internal func fill(with item: TabbarEntry) {

        self.tabbarEntry = item
        self.tag = item.rawValue

    }

    // MARK: - Helper
    private func setSelected(_ selected: Bool) {

        self.textLabel.isHidden = !selected
        self.textLabel.alpha = selected ? 1.0 : 0.0
        self.textLabel.text = self.tabbarEntry?.title
        self.iconImageView.image = selected ? self.tabbarEntry?.selectedImage : self.tabbarEntry?.image
    }
    
    func configureIconView() {

        self.contentView = self.loadFromNib(withName: String(describing: type(of: self)).components(separatedBy: ".").first!, owner: self, bundle: Bundle.main)
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.contentView)
        
        self.contentView.contrainToSuperviewEdges()
        self.contentView.backgroundColor = .clear
        
    }
    
     func loadFromNib(withName nibName: String, owner: AnyObject? = nil, bundle: Bundle? = nil) -> UIView {

        let currentBundle: Bundle = {

            if let bundle = bundle {

                return bundle
            }

            return Bundle.main
        }()

        guard let view: UIView = currentBundle.loadNibNamed(nibName, owner: owner, options: nil)?.first as? UIView else {
            fatalError("UIView \(nibName) not found in Bundle \(currentBundle)")
        }

        return view
    }
    
}
