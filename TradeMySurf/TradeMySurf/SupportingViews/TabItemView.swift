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
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var textLabel: UILabel!

    // MARK: - Properties
    private var tabbarEntry: TabbarEntry?

    internal var isSelected: Bool = false {

        didSet {

            self.setSelected(self.isSelected)
        }
    }

    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.backgroundColor = .clear
        self.textLabel.textColor = .systemIndigo
        self.textLabel.isHidden = true
        self.textLabel.text = nil
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configuration
    internal func configure(with item: TabbarEntry) {

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
}
