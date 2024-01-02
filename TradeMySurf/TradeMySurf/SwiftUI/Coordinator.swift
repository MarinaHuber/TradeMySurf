//
//  Coordinator.swift
//  TradeMySurf
//
//  Created by Marina Huber on 02.01.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

final class Coordinator: ObservableObject {

    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?

    func push(_ page: Page) {
        path.append(page)
    }

    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }

    func present(_ fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }

    func pop() {
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }

    func dismissSheet() {
        self.sheet = nil
    }

    func dismissFullScreenCover() {
        self.fullScreenCover = nil
    }

    @ViewBuilder
    func bulid(sheet: Sheet) -> some View {
        switch sheet {
        case .confirm:
            SplashView()
        case .location:
            SplashView()
        case .surfDetail:
            SplashView()
        }
    }

    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .splash:
            SplashView()
        case .welcome:
            WelcomeView()
        case .addLevel:
            WelcomeView()
        case .addDate:
            WelcomeView()
        }
    }

    @ViewBuilder
    func bulid(page: Page) -> some View {
        if (page == .surfTrip) {
            NavigationStack {
                WelcomeView()
            }
        }
    }
}
