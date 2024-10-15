//
//  LocationView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI


struct LocationView: View {
    @State var item: Surfboard // Assuming Surfboard is used for locations as well
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
            DetailsLocationView(transitionId: transitionId, onClose: {
                showingSheet.toggle()
            })
        }
    }
}

//#Preview {
//    LocationdView()
//}
