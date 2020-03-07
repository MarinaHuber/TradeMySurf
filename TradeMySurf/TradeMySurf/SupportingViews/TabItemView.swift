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
    let iconTab          = UIImageView()
    let titleLabel       = TitleLabel(textAlignment: .center, fontSize: 9)
    
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
         self.commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .clear
        self.titleLabel.textColor = .white
        self.titleLabel.isHidden = true
        self.titleLabel.text = nil
        
        self.configureIconView()
        
    }

    // MARK: - Configuration
    internal func fill(with item: TabbarEntry) {

        self.tabbarEntry = item
        self.tag = item.rawValue

    }

    // MARK: - Helper
    private func setSelected(_ selected: Bool) {

        self.titleLabel.isHidden = !selected
        self.titleLabel.alpha = selected ? 1.0 : 0.0
        self.titleLabel.text = self.tabbarEntry?.title
        self.iconTab.image = selected ? self.tabbarEntry?.selectedImage : self.tabbarEntry?.image
    }
    
    func configureIconView() {
        iconTab.translatesAutoresizingMaskIntoConstraints = false
        let stackView = UIStackView(arrangedSubviews: [iconTab, titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(stackView)
        stackView.contrainToSuperviewEdges()
//        guard let superview = self.superview else {
//            return
//        }
//        superview.translatesAutoresizingMaskIntoConstraints = false
//        self.frame = superview.bounds
//
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0.0),
//            stackView.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0.0),
//            stackView.topAnchor.constraint(equalTo: superview.topAnchor, constant: 3),
//            stackView.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -3)
//
//        ])
    }
    
}
