//
//  BuyTipsViewController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/5/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
import UIKit

protocol SurfViewControllerDelegate: class {
    func childDidFinish()
}

class SurfTripViewController: UIViewController {
    weak var delegate: SurfViewControllerDelegate?
   // var coordinator: TabBarCoordinator?
    lazy var leftBtn: UIBarButtonItem = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.turn.up.left"), for: .normal)
        button.sizeToFit()
        button.addTarget(self,
                         action: #selector(self.popToRoot(_:)),
                         for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }()

	private var selectedLevel = UserDefaults.standard.selectedLevel
	private var selectedDate = UserDefaults.standard.surfingTime

    private(set) var collectionView: UICollectionView!
	private var sections: [TripSection] = []
    private(set) var dataSource: UICollectionViewDiffableDataSource<TripSection, TripItem>! // retain data source!
    private(set) var appData: RecommendedTripArray = RecommendedTripArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
        configureCollectionView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationItem.leftBarButtonItem = leftBtn
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //UserDefaults.standard.userWasHere = false
    }    
    @objc func popToRoot(_ sender: UIBarButtonItem) {
        if UserDefaults.standard.userWasHere == false {
        let storyboard: UIStoryboard = UIStoryboard(name: Constants.Storyboards.welcomeViewCoordinator, bundle: nil)
        let controller: WelcomeViewController = WelcomeViewController.instantiate(from: storyboard)
        delegate?.childDidFinish()
        navigationController?.setViewControllers([controller], animated: true)
        } else {
           self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }

}

private extension SurfTripViewController {

func configureDiffableDataSource() {
	let dataSource = UICollectionViewDiffableDataSource<TripSection, TripItem>(collectionView: collectionView) {
        (collectionView: UICollectionView, indexPath: IndexPath, item: TripItem) -> UICollectionViewCell? in

		switch item {
		case .tip(let tip):
			let cell = collectionView.dequeueCell(ofType: SmallTableViewCell.self, for: indexPath)
			cell.fillWithData(tip)
			return cell
		case .surfboardsBeginner(let board), .surfboardsBeginnerInter(let board), .surfboardsIntermediate(let board), .surfboardsAdvanced(let board), .surfboardsPro(let board):
			let cell = collectionView.dequeueCell(ofType: SurfBoardCollectionViewCell.self, for: indexPath)
			cell.fillWithData(board)
			return cell
		case .surfCountrySummer(let location), .surfCountryAutumn(let location), .surfCountryWinter(let location), .surfCountrySpring(let location):
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

		let pickerString = Level.enumFromString(string: selectedLevel ?? "")
		switch pickerString {
		case .beginner:
			snapshot.appendSections([.surfboardsBeginner])
			snapshot.appendItems(appData.surfboardsBeginner.map({ TripItem.surfboardsBeginner($0) }))
		case .beginnerIntemediate:
			snapshot.appendSections([.surfboardsBeginnerInter])
			snapshot.appendItems(appData.surfboardsBeginnerInter.map({ TripItem.surfboardsBeginnerInter($0) }))
		case .intermediate:
			snapshot.appendSections([.surfboardsIntermediate])
			snapshot.appendItems(appData.surfboardsIntermediate.map({  TripItem.surfboardsIntermediate($0) }))
		case .advanced:
			snapshot.appendSections([.surfboardsAdvanced])
			snapshot.appendItems(appData.surfboardsAdvanced.map({  TripItem.surfboardsAdvanced($0) }))
		case .professional:
			snapshot.appendSections([.surfboardsPro])
			snapshot.appendItems(appData.surfboardsPro.map({  TripItem.surfboardsPro($0) }))
        default: break
		}
		let selected = makeIntFromMonth()
		let pickerDate = Season.sortBy(month: selected)
		switch pickerDate {
		case 0:
			snapshot.appendSections([.surfCountryWinter])
			snapshot.appendItems(appData.surfCountryWinter.map({ TripItem.surfCountryWinter($0) }))
		case 1:
			snapshot.appendSections([.surfCountrySpring])
			snapshot.appendItems(appData.surfCountrySpring.map({ TripItem.surfCountrySpring($0) }))
		case 2:
			snapshot.appendSections([.surfCountrySummer])
			snapshot.appendItems(appData.surfCountrySummer.map({ TripItem.surfCountrySummer($0) }))
		case 3:
			snapshot.appendSections([.surfCountryAutumn])
			snapshot.appendItems(appData.surfCountryAutumn.map({ TripItem.surfCountryAutumn($0) }))
        default: break
		}

		sections = snapshot.sectionIdentifiers
        dataSource.apply(snapshot, animatingDifferences: animated)
    }

}
// MARK: - Business logic -
private extension SurfTripViewController {

	func makeIntFromMonth() -> Int {
		let monthOfYear = selectedDate?.month
		let dateFormat = DateFormatter()
		dateFormat.dateFormat = "LLLL"
		let date = dateFormat.date(from: monthOfYear ?? "")
		let monthInt = Calendar.current.component(.month, from: date ?? Date())
		return monthInt
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
				case .surfboardsBeginner, .surfboardsBeginnerInter, .surfboardsIntermediate, .surfboardsAdvanced, .surfboardsPro:
					section = strongSelf.makeSurfboardSection()
				case .surfCountrySummer, .surfCountryAutumn, .surfCountryWinter, .surfCountrySpring:
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
		let largeItemSize = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width / 3),
												   heightDimension: .fractionalHeight(1.0))
        let largeItem = NSCollectionLayoutItem(layoutSize: largeItemSize)
        let groupOf2Size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(view.frame.size.width * 2),
												  heightDimension: .estimated(300))
        let groupOf3 = NSCollectionLayoutGroup.horizontal(layoutSize: groupOf2Size, subitems: [largeItem])
        groupOf3.interItemSpacing = .fixed(10)
        let section = NSCollectionLayoutSection(group: groupOf3)
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary

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
