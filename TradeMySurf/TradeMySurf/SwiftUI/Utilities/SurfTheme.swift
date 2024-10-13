//
//  SurfTheme.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.05.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI
/**
 Surf Theme
 */
struct SurfTheme: ThemeProtocol {
    var largeTitleFont: Font = .custom("AvenirNextCyr-Heavy", size: 29)
    var normalBtnTitleFont: Font = .custom("AvenirNextCyr-Demi", size: 25)
    var textTitleFont: Font = .custom("AvenirNextCyr-Medium", size: 21)
    var bodyTextFont: Font = .custom("AvenirNextCyr-Medium", size: 19)
    var captionTxtFont: Font = .custom("AvenirNextCyr-Light", size: 16)
    var regularTitleFont: Font = .custom("AvenirNextCyr-Regular", size: 14)
    var pickerFont: Font = .custom("AvenirNextCyr-Demi", size: 13)
    var tabbarFont: Font = .custom("AvenirNextCyr-Demi", size: 12)

    var primaryThemeColor: Color { return Color("pastelPrimary") }
    var secondoryThemeColor: Color { return Color("secondoryThemeColor") }
}
