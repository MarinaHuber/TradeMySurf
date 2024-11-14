//
//  LocationView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI


struct LocationView: View {
    @State var item: Surfboard
    @Namespace private var transitionId
    @State private var showingSheet = false
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            HStack {
                Image(item.imageFlag)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                VStack(alignment: .leading) {
                    Text(item.countryName)
                        .font(themeManager.selectedTheme.bodyTextFont)
                        .foregroundColor(.primary)
                    Text(item.continentName)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
        }
        .applyMatchedTransition(for: item, transitionId: transitionId)
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .fullScreenCover(isPresented: $showingSheet) {
            DetailsLocationView(queryLocation: item.countryName, transitionId: transitionId, onClose: {
                showingSheet.toggle()
            })
        }
    }
}

    // View extension to conditionally apply the matchedTransitionSource
extension View {
    func applyMatchedTransition(for item: Surfboard, transitionId: Namespace.ID) -> some View {
        if #available(iOS 18, *) {
                // You can use `self` here because this method doesn't need to return a different type
            return self.matchedTransitionSource(id: item, in: transitionId)
        } else {
            return self // Just return self if iOS version is below 18
        }
    }
}
