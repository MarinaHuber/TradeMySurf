//
//  TabBarView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

import SwiftUI

struct TabBarView: UIViewControllerRepresentable {

    typealias UIViewControllerType = TabBarVC

    func makeUIViewController(context: Context) -> TabBarVC {
        TabBarVC()
    }

    func updateUIViewController(_ uiViewController: TabBarVC, context: Context) {
            // Update the ViewController here
    }
}
