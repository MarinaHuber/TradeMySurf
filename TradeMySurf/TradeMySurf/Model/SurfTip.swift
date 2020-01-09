//
//  SurfTip.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

public struct SurfTip: Hashable {
    public let id: UUID = UUID()
    public let title: String
    public let description: String
    public let descriptionLocation: String
}
