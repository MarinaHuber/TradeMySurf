//
//  DetailsSurfboardView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct DetailsSurfboardView: View {
    var transitionId: Namespace.ID
    @State var item: Surfboard?
    var onClose: () -> Void
    @EnvironmentObject private var themeManager: ThemeManager

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 0) {
                    if let imageName = item?.imageName, !imageName.isEmpty {
                        Spacer()
                            .frame(height: 20)
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                            .overlay(alignment: .topLeading) {
                                closeButton
                                    .padding()
                                    .safeAreaInset(edge: .top) {
                                        Spacer()
                                            .frame(height: 20)
                                    }
                            }
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text("Board for - \(item?.level ?? "Unknown Level")")
                            .font(themeManager.selectedTheme.normalBtnTitleFont)

                        Text("Volume: \(item?.volume ?? "N/A")")
                            .font(themeManager.selectedTheme.regularTitleFont)

                        Text("Weight: \(item?.weight ?? 0) kg")
                            .font(themeManager.selectedTheme.regularTitleFont)
                    }
                    .padding(15)
                    .cornerRadius(10)
                    .frame(minHeight: geometry.size.height * 0.25)
                    .background(Color.white)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .navigationTransition(.zoom(sourceID: item, in: transitionId))
    }

    private var closeButton: some View {
        Button {
            onClose()
        } label: {
            Image(systemName: "xmark")
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .padding(8)
        }
        .buttonStyle(BorderlessButtonStyle())
        .background(Material.thick)
        .clipShape(Circle())
        .frame(width: 50, height: 50)
        .padding()
    }

}

#Preview {
    DetailsSurfboardView(transitionId: Namespace().wrappedValue, onClose: { })
}
