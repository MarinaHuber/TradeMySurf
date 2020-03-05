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
    let iconTab         = UIImageView()
    let titleLabel      = TitleLabel(textAlignment: .center, fontSize: 9)
    
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
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Configuration
    internal func fill(with item: TabbarEntry) {

        self.tabbarEntry = item
        self.tag = item.rawValue
        self.backgroundColor = .clear
        self.titleLabel.textColor = .white
       // self.titleLabel.isHidden = true
       // self.titleLabel.text = nil
        configureImageView()
       // configureTitleLabel()
    }

    // MARK: - Helper
    private func setSelected(_ selected: Bool) {

        self.titleLabel.isHidden = !selected
        self.titleLabel.alpha = selected ? 1.0 : 0.0
        self.titleLabel.text = self.tabbarEntry?.title
        self.iconTab.image = selected ? self.tabbarEntry?.selectedImage : self.tabbarEntry?.image
    }
    
    func configureImageView() {
        iconTab.translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(arrangedSubviews: [iconTab, titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7)
        ])
    }
    
//    func configureTitleLabel() {
//
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: iconTab.topAnchor, constant: padding),
//            titleLabel.leadingAnchor.constraint(equalTo: iconTab.leadingAnchor, constant: padding),
//            titleLabel.trailingAnchor.constraint(equalTo: iconTab.trailingAnchor, constant: -padding),
//            titleLabel.heightAnchor.constraint(equalToConstant: 10)
//        ])
//    }
}
