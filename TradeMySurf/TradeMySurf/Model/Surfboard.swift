//
//  SurfTextModel.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/10/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

public struct Surfboard: Hashable {
    public let id: UUID = UUID()
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Surfboard, rhs: Surfboard) -> Bool {
        return lhs.id == rhs.id
    }
	public let level: String, volume: String
	public let weight: Int
	public let weightUnit: String, imageName: String
    public let beaufortScaleWave: String
}
