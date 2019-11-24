//
//  SurfStorage.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import  Foundation

struct Location: Hashable {
    let id: UUID = UUID()
    let countryName: String
	let continentName: String
    let imageFlag: String
}

