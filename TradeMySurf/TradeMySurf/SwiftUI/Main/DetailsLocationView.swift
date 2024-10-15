//
//  DetailsLocationView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 15.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct DetailsLocationView: View {    var transitionId: Namespace.ID
    @State var item: Surfboard?

    var body: some View {
        Text("Hello, World!")
            .overlay(alignment: .topLeading) {
                Group {
                    Button {
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
            .edgesIgnoringSafeArea(.top)
            .navigationTransition(.zoom(sourceID: item, in: transitionId))
    }
}

//#Preview {
//    DetailsLocationView(transitionId: "")
//}
