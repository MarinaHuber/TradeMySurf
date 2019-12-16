//
//  SurfStorage.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import  Foundation

struct Location: Hashable {
    var id: UUID = UUID()
    var countryName: String
	var continentName: String
    var imageFlag: String
}

extension Location {

    internal func filterBySurfDate() -> Location? {

        return self
    }
}

