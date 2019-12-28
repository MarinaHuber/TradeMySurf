//
//  SurfStorage.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import  Foundation

public struct Location: Hashable {
    public let id: UUID = UUID()
    public let countryName: String
    public let continentName: String
    public let imageFlag: String
}


