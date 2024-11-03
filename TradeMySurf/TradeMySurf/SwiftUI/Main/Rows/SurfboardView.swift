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
                Image(surfboard.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        .frame(width: 120)
        .cornerRadius(10)
        .buttonStyle(.plain)
        .shadow(color: .gray.opacity(0.7), radius: 12)

            // Conditionally apply iOS 18+ matched transition and full-screen cover
        .applyFullScreenCover(for: item, showingSheet: $showingSheet, transitionId: transitionId)
    }
}

    // Extension to manage full-screen cover conditionally
extension View {
    @ViewBuilder
    func applyFullScreenCover(for item: Surfboard?, showingSheet: Binding<Bool>, transitionId: Namespace.ID) -> some View {
        if #available(iOS 18, *) {
            self
                .matchedTransitionSource(id: item, in: transitionId)
                .fullScreenCover(isPresented: showingSheet) {
                    DetailsSurfboardView(transitionId: transitionId, item: item, onClose: {
                        showingSheet.wrappedValue.toggle()
                    })
                }
        } else {
            self
                .fullScreenCover(isPresented: showingSheet) {
                    DetailsSurfboardView(transitionId: transitionId, item: item, onClose: {
                        showingSheet.wrappedValue.toggle()
                    })
                }
        }
    }
}


    // Updated conditionalModifier helper
extension View {
    @ViewBuilder
    func conditionalModifier<Content: View>(isIOS18: Bool = false, isBelowIOS18: Bool = false, @ViewBuilder content: (Self) -> Content) -> some View {
        if isIOS18 || isBelowIOS18 {
            content(self)
        } else {
            self
        }
    }
}


#Preview {
    SurfboardView()
}
