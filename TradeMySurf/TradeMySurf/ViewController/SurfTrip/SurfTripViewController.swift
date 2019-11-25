//
//  BuyTipsViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

class SurfTripViewController: UIViewController {

    enum TripSection: CaseIterable {
        case tips
        case surfboards
        case surfCountries
    }

    enum TripItem: Hashable {
        case tip(SurfTip)
        case surfboard(Surfboard)
        case surfCountry(Location)
    }
	private weak var coordinator: SurfTripCoordinator?

    private(set) var collectionView: UICollectionView!
	private var sections: [TripSection] = []
    private(set) var dataSource: UICollectionViewDiffableDataSource<TripSection, TripItem>! // retain data source!

    private(set) var appData: RecommendedTrip = RecommendedTrip()

    override func viewDidLoad() {
        super.viewDidLoad()

        addCollectionView()
        configureCollectionView()
    }
}

private extension SurfTripViewController {

func configureDiffableDataSource() {

	let dataSource = UICollectionViewDiffableDataSource<TripSection, TripItem>(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, item: TripItem) -> UICollectionViewCell? in

		switch item {
		case .tip(let tip):
			let cell = collectionView.dequeueCell(ofType: SmallTableViewCell.self, for: indexPath)
			cell.fillWithData(tip)
			return cell
		case .surfboard(let board):
			let cell = collectionView.dequeueCell(ofType: SurfBoardCollectionViewCell.self, for: indexPath)
			cell.fillWithData(board)
			return cell
		case .surfCountry(let location):
			let cell = collectionView.dequeueCell(ofType: LocationCollectionViewCell.self, for: indexPath)
			cell.fillWithData(location)
			return cell
		}
	}

	self.dataSource = dataSource
	updateSnapshot(animated: false)
  }

    func updateSnapshot(animated: Bool = true) {
		var snapshot = NSDiffableDataSourceSnapshot<TripSection, TripItem>()
		snapshot.appendSections([.tips])
		snapshot.appendItems(appData.tips.map({ TripItem.tip($0) }))

        snapshot.appendSections([.surfboards])
        snapshot.appendItems(appData.surfboards.map({ TripItem.surfboard($0) }))

        snapshot.appendSections([.surfCountries])
        snapshot.appendItems(appData.surfCountries.map({ TripItem.surfCountry($0) }))
		sections = snapshot.sectionIdentifiers

        dataSource.apply(snapshot, animatingDifferences: animated)
    }
}
// MARK: - Collection View Layout -

private extension SurfTripViewController {

    func makeCompositionalLayout() -> UICollectionViewLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 10

        let layout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] (sectionIndex: Int, _ : NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            guard let strongSelf = self else {
                return nil
            }

            let guideSection = strongSelf.sections[sectionIndex]

            let section: NSCollectionLayoutSection
            switch guideSection {
			case .tips:
					section = strongSelf.makeSmallTableSection()
			case .surfboards:
					section = strongSelf.makeSurfboardSection()
			case .surfCountries:
					section = strongSelf.makeLocationSection()
            }

            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
            return section

        }, configuration: configuration)

        return layout
    }

	func makeSmallTableSection() -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
											  heightDimension: .estimated(40))
		let item = NSCollectionLayoutItem(layoutSize: itemSize)

		let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
											   heightDimension: .estimated(100)) // this value doesn't matter
		let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

		group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

		let section = NSCollectionLayoutSection(group: group)
		section.interGroupSpacing = 10

		return section
	}

    func makeSurfboardSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let largeItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                   heightDimension: .fractionalHeight(1.0))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)

        let groupOf2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.58),
                                                  heightDimension: .fractionalHeight(1.0))
        let groupOf2 = NSCollectionLayoutGroup.vertical(layoutSize: groupOf2Size, subitem: item, count: 2)
        groupOf2.interItemSpacing = .fixed(10)

        let groupOf3Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let groupOf3 = NSCollectionLayoutGroup.horizontal(layoutSize: groupOf3Size, subitems: [largeItem, groupOf2])
        groupOf3.interItemSpacing = .flexible(0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8),
                                               heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: groupOf3, count: 1)

        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }

	 func makeLocationSection() -> NSCollectionLayoutSection {
		let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)

        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(10)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10

        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

        return section
	}
}

// MARK: - Collection View Delegate -

extension SurfTripViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.backgroundColor = UIColor.systemGray6
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
    }
}
// MARK: - Basic UI -

private extension SurfTripViewController {

    func addCollectionView() {
        let layout = makeCompositionalLayout()

        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.contentInset.top = 10

        view.addSubview(collectionView)

        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func configureCollectionView() {

        collectionView.registerCell(ofType: SmallTableViewCell.self)
        collectionView.registerCell(ofType: SurfBoardCollectionViewCell.self)
        collectionView.registerCell(ofType: LocationCollectionViewCell.self)

        collectionView.delegate = self // Set delegate before data source !!
        configureDiffableDataSource()
    }
}
// MARK: - Basic Navigation protocol -
extension SurfTripViewController: StoryboardProtocol {}
