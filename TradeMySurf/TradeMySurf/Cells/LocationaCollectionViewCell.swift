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

      //  self.configureUI()
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

//func configureUI() {
//
//	// Styling
//	nameCountryLabel.font = UIFont.preferredFont(forTextStyle: .headline)
//	nameCountryLabel.textColor = .label
//
//	subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
//	subtitle.textColor = .secondaryLabel
//
//	imageView.layer.cornerRadius = 15
//	imageView.backgroundColor = .systemTeal
//	imageView.contentMode = .scaleAspectFill
//	imageView.clipsToBounds = true
//
//	// Layout
//
//	imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//
//	let labelStackView = UIStackView(arrangedSubviews: [nameCountryLabel, subtitle])
//	labelStackView.axis = .vertical
//	labelStackView.alignment = .center
//	labelStackView.spacing = 5
//	labelStackView.translatesAutoresizingMaskIntoConstraints = false
//
//	let outerStackView = UIStackView(arrangedSubviews: [imageView, labelStackView])
//	outerStackView.alignment = .center
//	outerStackView.axis = .horizontal
//	outerStackView.spacing = 10
//	outerStackView.translatesAutoresizingMaskIntoConstraints = false
//
//	 let container = self.contentView
//	container.addSubview(outerStackView)
//
//    outerStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
//	outerStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
//	outerStackView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
//	outerStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
// }

}
