    //
    //  AlertButtonView.swift
    //  TradeMySurf
    //
    //  Created by Marina Huber on 22.08.2023..
    //  Copyright © 2022 Marina Huber. All rights reserved.
    //

import SwiftUI

struct AlertButtonView: View {

    var vm: ViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            SwiftUI.Button(action: {
                self.vm.backAction()
            }) {
                Text("Try again")
                    .bold()
                    .font(.body)
                    .foregroundColor(Color.red)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 1)
                    )
            }
            SwiftUI.Button(action: {
                self.vm.closeAction()

            }) {
                Text("Match me")
                    .bold()
                    .font(.body)
                    .foregroundColor(Color.white)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1)
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)

    }
}

struct AlertButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AlertButtonView(vm: .init())
    }
}
