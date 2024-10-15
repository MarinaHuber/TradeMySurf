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
        ScrollView {
            VStack(alignment: .leading) {
                if let imageName = item?.imageName, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.bottom, 20)
                        .overlay(alignment: .topLeading) {
                            Group {
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
                            }
                            .padding()
                            .safeAreaInset(edge: .top) {
                                Spacer()
                                    .frame(height: 20) // Add some extra top space
                            }
                        }
                } else { }

                Group {
                    Text("Board for - \(item?.level ?? "Unknown Level")")
                        .font(themeManager.selectedTheme.normalBtnTitleFont)

                    Text("Volume: \(item?.volume ?? "N/A")")
                        .font(themeManager.selectedTheme.regularTitleFont)

                    Text("Weight: \(item?.weight ?? 0) kg")
                        .font(themeManager.selectedTheme.regularTitleFont)

                }.padding(.leading, 25)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationTransition(.zoom(sourceID: item, in: transitionId))
    }
}


//#Preview {
//    DetailsSurfboardView(transitionId: Namespace.ID())
//}
