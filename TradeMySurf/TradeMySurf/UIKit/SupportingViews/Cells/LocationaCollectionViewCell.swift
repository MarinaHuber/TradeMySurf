//
//  LocationaCollectionViewCell.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {

    let nameCountryLabel: UILabel = {
        let nameCountryLabel = UILabel()
        nameCountryLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameCountryLabel.textColor = .label
        return nameCountryLabel
    }()
	let subtitle: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitle.textColor = .secondaryLabel
        return subtitle
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.backgroundColor = .systemTeal
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

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

    func fillWithData(_ data: Surfboard) {
        nameCountryLabel.text = data.countryName
		subtitle.text = data.continentName
        imageView.image = UIImage(named: data.imageFlag)
    }

}

// MARK: - UI -

private extension LocationCollectionViewCell {
    
    

func configureUI() {
    contentView.layer.cornerRadius = 10
	imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)

	let labelStackView = UIStackView(arrangedSubviews: [nameCountryLabel, subtitle])
	labelStackView.axis = .vertical
	labelStackView.alignment = .center
	labelStackView.spacing = 5
	labelStackView.translatesAutoresizingMaskIntoConstraints = false

	let outerStackView = UIStackView(arrangedSubviews: [imageView, labelStackView])
	outerStackView.alignment = .center
	outerStackView.axis = .horizontal
	outerStackView.spacing = 10
	outerStackView.translatesAutoresizingMaskIntoConstraints = false

	 let container = self.contentView
	container.addSubview(outerStackView)
    imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10.0).isActive = true
    outerStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
	outerStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
	outerStackView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
	outerStackView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
 }

}
