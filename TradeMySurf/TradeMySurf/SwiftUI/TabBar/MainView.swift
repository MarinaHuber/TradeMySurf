//
//  MainView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State private var selectedTab: TabbarEntrySwiftUI = .recommended

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                RecommendedView()
                    .tag(TabbarEntrySwiftUI.recommended)
                CalculatorView()
                    .tag(TabbarEntrySwiftUI.calculator)
                GuideView()
                    .tag(TabbarEntrySwiftUI.guide)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabbarEntrySwiftUI
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        HStack {
            ForEach(TabbarEntrySwiftUI.allCases, id: \.self) { tab in
                TabItemViewSwiftUI(tab: tab, isSelected: selectedTab == tab)
                    .onTapGesture {
                        selectedTab = tab
                    }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(themeManager.selectedTheme.primaryThemeColor))
        .opacity(0.8)
        .cornerRadius(20)
        .padding(.horizontal)
        .padding(.bottom, 8)
    }
}

struct TabItemViewSwiftUI: View {
    let tab: TabbarEntrySwiftUI
    let isSelected: Bool
    @EnvironmentObject private var themeManager: ThemeManager


    var body: some View {
        HStack(spacing: 4) {
            Text(tab.title)
                .font(themeManager.selectedTheme.tabbarFont)
                .foregroundColor(.white)
                .opacity(isSelected ? 1 : 0)
                .frame(minWidth: 40, alignment: .trailing)

            Image(isSelected ? tab.selectedImage: tab.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
        }
        .frame(height: 32)
        .padding(.horizontal, 12)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
