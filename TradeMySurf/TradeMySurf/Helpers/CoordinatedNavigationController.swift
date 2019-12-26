//
//  CoordinatedNavigationController.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/26/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//


import UIKit

/// A navigation controller that is aware of its coordinator. This is used extremely rarely through UIResponder-Coordinated.swift, for when we need to find the coordinator responsible for a specific view.
class CoordinatedNavigationController: UINavigationController {
    weak var coordinator: Coordinator?
}
