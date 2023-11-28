//
//  ReuseIdentifierHelper.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import UIKit

extension UICollectionView {

    func dequeueCell<CellType: UICollectionViewCell>(ofType: CellType.Type, for indexPath: IndexPath) -> CellType {

        let reuseIdentifier = "\(CellType.self)"
        let someCell = self.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let cell = someCell as? CellType else {
            fatalError("Could not dequeue cell of type \(CellType.self)")
        }
        return cell
    }

    func registerCell<CellType: UICollectionViewCell>(ofType: CellType.Type) {

        let reuseIdentifier = "\(CellType.self)"
        self.register(CellType.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    func registerReusableView<ViewType: UICollectionReusableView>(ofType: ViewType.Type, forKind kind: String) {

        let reuseIdentifier = "\(ViewType.self)"
        self.register(ViewType.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIdentifier)
    }

    func dequeueReusableView<ViewType: UICollectionReusableView>(ofType: ViewType.Type, forKind kind: String, for indexPath: IndexPath) -> ViewType {

        let reuseIdentifier = "\(ViewType.self)"
        let someView = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let view = someView as? ViewType else {
            fatalError("Could not dequeue supplementary view of type \(ViewType.self)")
        }
        return view
    }
}

