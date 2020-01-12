//
//  SurfboardCollectionViewCell.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import UIKit

class SurfBoardCollectionViewCell: UICollectionViewCell {

    let titleLabel: UILabel = UILabel()
	let volumeLabel: UILabel = UILabel()
	let weightLabel: UILabel = UILabel()
	let weightUnit: UILabel = UILabel()
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

extension SurfBoardCollectionViewCell {

	func fillWithData(_ model: Surfboard) {
		titleLabel.text = model.level
		volumeLabel.text = model.volume
		weightLabel.text = "\(model.weight)"
		weightUnit.text = model.weightUnit
		imageView.image = UIImage(named: model.imageName)
	}
}
// MARK: - UI -

private extension SurfBoardCollectionViewCell {

    func configureUI() {

        // Styling

        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true

        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)

		volumeLabel.font = UIFont.preferredFont(forTextStyle: .title3)

        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemTeal
		imageView.layer.cornerRadius = 15
		imageView.clipsToBounds = true

        // Layout

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
		volumeLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)

		let stackLabelView = UIStackView(arrangedSubviews: [titleLabel, volumeLabel, weightLabel, weightUnit])
        stackLabelView.axis = .vertical
        stackLabelView.translatesAutoresizingMaskIntoConstraints = false
        stackLabelView.alignment = .center
        stackLabelView.spacing = 5

        let container = self.contentView
        container.addSubview(imageView)
        container.addSubview(stackLabelView)

        stackLabelView.leadingAnchor.constraint(equalTo: container.layoutMarginsGuide.leadingAnchor).isActive = true
        stackLabelView.trailingAnchor.constraint(equalTo: container.layoutMarginsGuide.trailingAnchor).isActive = true
        stackLabelView.topAnchor.constraint(equalTo: container.layoutMarginsGuide.topAnchor).isActive = true

        imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
}
