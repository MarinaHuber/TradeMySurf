//
//  ContentView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/11/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import SwiftUI

/// Main View
struct ContentView: View {

    var body: some View {
        VStack {
            Spacer()
            Button(action: {

            }) {
                Text("Send email")
            }
            Spacer()
            Button(action: {

			}) {
                Text("Send message")
            }
            Spacer()
        }
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

