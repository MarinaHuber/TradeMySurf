//
//  AlertButtonView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 13.10.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct AlertButtonView: View {
    var vm: ViewModel

    var body: some View {
       // NavigationStack {
            HStack(alignment: .center, spacing: 30) {
                Group {
                    Button(action: {
                        self.vm.backAction()
                    }) {
                        Text(" Cancel  ")
                            .bold()
                            .font(.body)
                            .foregroundColor(.red)
                            .frame(width: 120, height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.red, lineWidth: 1)
                            )
                    }
                    Button(action: {
                        self.vm.closeAction()
                        
                    }) {
                        Text("Match me")
                            .bold()
                            .font(.body)
                            .foregroundColor(.white)
                            .frame(width: 120, height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 1)
                            )
                    }
                }
            }
       // }

    }
}

struct AlertButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AlertButtonView(vm: .init())
    }
}
