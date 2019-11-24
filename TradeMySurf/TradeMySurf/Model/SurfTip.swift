//
//  SurfTip.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct SurfTip: Hashable {
    let id: UUID = UUID()
    let title: String
    let description: String
}
