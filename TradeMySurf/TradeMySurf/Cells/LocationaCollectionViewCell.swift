//
//  LocationaCollectionViewCell.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {

    let nameCountryLabel: UILabel = UILabel()
	let subtitle: UILabel = UILabel()
    let imageView: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Data -

extension LocationCollectionViewCell {

    func fillWithData(_ data: Location) {
        nameCountryLabel.text = data.countryName
		subtitle.text = data.continentName
        imageView.image = UIImage(named: data.imageFlag)
    }
}

// MARK: - UI -

private extension LocationCollectionViewCell {

func configureUI() {
    let nameCountryLabel = UILabel()
    let subtitle = UILabel()
    let imageView = UIImageView()
        nameCountryLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameCountryLabel.textColor = .label

        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitle.textColor = .secondaryLabel

        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true

        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)

        let innerStackView = UIStackView(arrangedSubviews: [nameCountryLabel, subtitle])
        innerStackView.axis = .vertical

        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .center
        outerStackView.spacing = 10
        contentView.addSubview(outerStackView)

        NSLayoutConstraint.activate([
            outerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            outerStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }

}
