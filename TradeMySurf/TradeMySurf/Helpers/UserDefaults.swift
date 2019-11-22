//
//  UserDefaults.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/21/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

enum Levels: String, CaseIterable {
    case beginner = "Learning to stand up in white water waves"
    case beginnerIntemediate = "Paddling out, dropping straight down the face of the wave"
    case intermediate = "Trimming down the middle line of the wave"
    case advanced = "Performing full carving changes"
	case professional = "Professional level speed, power and flow maneuvers"
}

enum UserDefaultsUnitKey: String, CaseIterable {

    case beginner = "Overcoming the white water, learning to stand up"
    case beginnerIntemediate = "Paddling out, dropping straight down the face of the wave"
    case intermediate = "Trimming down the middle line of the wave"
    case advanced = "Performing buttom turns and full carving changes"
	case professional = "Professional speed, power and flow maneuvers"
}
