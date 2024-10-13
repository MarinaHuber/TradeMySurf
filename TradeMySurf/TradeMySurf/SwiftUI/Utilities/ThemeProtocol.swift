//
//  File.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.05.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI
/**
 Protocol for themes
 */
protocol ThemeProtocol {
    var largeTitleFont: Font { get }
    var textTitleFont: Font { get }
    var normalBtnTitleFont: Font { get }
    var regularTitleFont: Font { get }
    var bodyTextFont: Font { get }
    var captionTxtFont: Font { get }
    var pickerFont: Font { get }
    var tabbarFont: Font { get }


    var primaryThemeColor: Color { get }
    var secondoryThemeColor: Color { get }
}

