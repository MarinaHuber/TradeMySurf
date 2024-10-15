//
//  Surfboard.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/10/20.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

public struct Surfboard: Hashable, Identifiable {
    public let id: UUID = UUID()
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Surfboard, rhs: Surfboard) -> Bool {
        return lhs.id == rhs.id
    }
    public let level: String, volume: String, imageName: String, weightUnit: String, beaufortScaleWave: String, countryName: String, continentName: String, imageFlag: String
	public let weight: Int
}
