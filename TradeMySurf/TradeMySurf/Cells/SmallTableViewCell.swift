//
//  SmallTableCell.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class SmallTableViewCell : UICollectionViewCell {
    
	let titleLabel: UILabel = UILabel()
    let dateLabel: UILabel = UILabel()
	let descriptionLabel: UILabel = UILabel()
    let windDescription: UILabel = UILabel()
	let selectedDate = UserDefaults.standard.surfingTime

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
// MARK: - Data -

extension SmallTableViewCell {

	func fillWithData(_ data: SurfTip) {
        titleLabel.text = "Your goal: \(data.title)"
        dateLabel.text = "You want to start surfing: \(selectedDate?.dateAsString(style: .long) ?? "")"
		descriptionLabel.text = data.description
        windDescription.text = data.descriptionLocation
	}
}
// MARK: - UI -

private extension SmallTableViewCell {

    func configureUI() {

        // Styling

        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont(descriptor: UIFont.preferredFont(forTextStyle: .headline).fontDescriptor.withSymbolicTraits(.traitLooseLeading)!, size: 19)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        descriptionLabel.textAlignment = .natural
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        
        dateLabel.textAlignment = .natural
        dateLabel.font = UIFont(descriptor: UIFont.preferredFont(forTextStyle: .headline).fontDescriptor.withSymbolicTraits(.traitLooseLeading)!, size: 19)
        dateLabel.textColor = .black
        dateLabel.numberOfLines = 0
        
        windDescription.textAlignment = .natural
        windDescription.font = .preferredFont(forTextStyle: .body)
        windDescription.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel, dateLabel, windDescription])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5

        // Layout

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let container = self.contentView

        container.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0).left).isActive = true
        stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 3).left).isActive = true
        stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 0).left).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: UIEdgeInsets(top: 0, left: 5, bottom: 3, right: 3).left).isActive = true
    }
}
