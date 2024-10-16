//
//  TabbarEntrySwiftUI.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI
import CoreML

enum TabbarEntrySwiftUI: Int, CaseIterable {
    case guide, recommended, calculator

    var title: String {
        switch self {
        case .guide: return "Surf guide"
        case .recommended: return "Level match"
        case .calculator: return "Boards"
        }
    }

    var selectedImage: String {
        switch self {
        case .guide: return "info_tabActive"
        case .recommended: return "recommend_tabActive"
        case .calculator: return "price_tabActive"
        }
    }

    var image: String {
        switch self {
        case .guide: return "info_inactive"
        case .recommended: return "recommend_inactive"
        case .calculator: return "price_inactive"
        }
    }
}

//#Preview {
//    TabbarEntrySwiftUI(rawValue: 2)
//}
