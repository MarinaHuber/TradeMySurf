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
                        .foregroundStyle(.black)
                    Text(item.continentName)
                        .font(themeManager.selectedTheme.captionTxtFont)
                        .foregroundStyle(.black)
                }
            }
        }
        .matchedTransitionSource(id: item, in: transitionId)
        .padding()
        .background(.white)
        .cornerRadius(10)
        .fullScreenCover(isPresented: $showingSheet) {
            DetailsLocationView(queryLocation: item.countryName, transitionId: transitionId, onClose: {
                showingSheet.toggle()
            })
        }
    }
}


struct TipView: View {
    let tip: SurfTip

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Your goal: \(tip.goal)")
                .font(.headline)
            Text(tip.description)
                .font(.body)
            if !tip.descriptionLocation.isEmpty {
                Text(tip.descriptionLocation)
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}
