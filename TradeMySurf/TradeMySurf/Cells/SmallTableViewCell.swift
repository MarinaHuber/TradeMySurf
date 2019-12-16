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
	let descriptionLabel: UILabel = UILabel()
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
		titleLabel.text = selectedDate?.dateAsString(style: .long)
		descriptionLabel.text = data.description
	}
}
// MARK: - UI -

private extension SmallTableViewCell {

    func configureUI() {

        // Styling

        titleLabel.textAlignment = .natural
        titleLabel.font = UIFont(descriptor: UIFont.preferredFont(forTextStyle: .title3).fontDescriptor.withSymbolicTraits(.traitBold)!, size: 0)
        titleLabel.textColor = .systemBlue

        descriptionLabel.textAlignment = .natural
        descriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
        descriptionLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5

        // Layout

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let container = self.contentView

        container.addSubview(stackView)

        stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor).isActive = true
    }
}
