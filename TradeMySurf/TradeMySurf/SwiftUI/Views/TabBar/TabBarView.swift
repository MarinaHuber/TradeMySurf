//
//  TabBarView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import UIKit
import SwiftUI

struct TabBarView: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> TabBarVC {
        let storyboard: UIStoryboard = UIStoryboard(name: "TabBarVC", bundle: nil)
        let controller: TabBarVC = TabBarVC.instantiate(from: storyboard)
        return controller
    }

    func updateUIViewController(_ uiViewController: TabBarVC, context: Context) {
    }
}
