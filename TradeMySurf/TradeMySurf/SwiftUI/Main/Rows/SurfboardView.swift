//
//  SurfboardView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct SurfboardView: View {
    @State var item: Surfboard?
    @Namespace private var transitionId
    @State private var showingSheet = false
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            if let surfboard = item {
                Image(surfboard.imageName)//images are Strings in assets named by numbers passed inside MockService data
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the maximum width and height of the parent
                    .clipped()
                    .overlay(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text("Board #\(surfboard.imageName)")
                                .font(themeManager.selectedTheme.captionTxtFont)
                                .multilineTextAlignment(.leading)
                            Spacer()
                                .frame(height: 4)
                            Text("\(surfboard.volume) volume")
                                .font(themeManager.selectedTheme.pickerFont)
                        }
                        .padding(10)
                        .frame(width: 120, height: 50)
                        .background(.thinMaterial)
                    }
            }
        }
        .matchedTransitionSource(id: item, in: transitionId)
        .frame(width: 120)
        .cornerRadius(10)
        .buttonStyle(.plain)
        .shadow(color: .gray.opacity(0.7), radius: 12)
        .fullScreenCover(isPresented: $showingSheet) {
            DetailsSurfboardView(transitionId: transitionId, item: item, onClose: {
                showingSheet.toggle()
            })
        }
    }
}

#Preview {
    SurfboardView()
}
