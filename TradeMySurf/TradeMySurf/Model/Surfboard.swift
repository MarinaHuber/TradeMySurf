//
//  SurfTextModel.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/10/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct Surfboard: Hashable {
    let id: UUID = UUID()
	let title: String, volume: String
	let weight: Int
	let weightUnit: String, imageName: String
	private(set) var levelType: Level!
}

extension Surfboard {

    internal func filterByLevel() -> Surfboard? {

        return self
    }
}
