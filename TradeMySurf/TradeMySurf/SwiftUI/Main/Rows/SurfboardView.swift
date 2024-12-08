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

                ZStack (alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10,
                                     style: .circular)
                    .fill(Color(UIColor.systemBackground).opacity(0.7))
                    .frame(width: UIScreen.main.bounds.width / 3)
                    .overlay(
                        OverlaySurfboardView(item: surfboard)
                    )
                    Image(surfboard.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 230, alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width / 3, height: 280)
        .buttonStyle(.plain)

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

struct OverlaySurfboardView: View {
    @State var item: Surfboard?
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        if let surfboard = item {
            VStack(alignment: .leading) {
                Spacer()
                Text("Board #\(surfboard.imageName)")
                    .padding(.bottom, 0)
                    .font(themeManager.selectedTheme.captionTxtFont)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                Text("\(surfboard.volume) volume")
                    .padding(.bottom, 6)
                    .font(themeManager.selectedTheme.pickerFont)
                    .foregroundColor(.primary)

            }
            .frame(width: UIScreen.main.bounds.width / 3, height: 280)
           // .padding(.top, 230)
        }
    }
}


#Preview {
    SurfboardView()
}
