
//
//  AlertSwiftUIView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 7/28/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import SwiftUI

class ViewModel {
    var closeAction: () -> Void = {}
}

struct AlertSwiftUIView: View {
    
    var vm: ViewModel
    @State var gradient = [Color.red, Color.blue, Color.gray]
    @State var startPoint = UnitPoint(x: 0, y: 0)
    @State var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white)
                    .font(Font.system(.largeTitle).bold())
                    .padding()
                Text("Learning to stand up in white water waves")
                    .foregroundColor(Color.white)
                    .font(Font.system(.title).bold())
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Surfing start")
                    .foregroundColor(Color.white)
                Text("You are matched to surfboards and locations suitable for your level and date")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding()
                HStack {
                    Spacer()
                    SwiftUI.Button(action: {

                    }) {
                        Text("Try again")
                            .foregroundColor(Color.white)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                        )
                    }
                    Spacer()
                    SwiftUI.Button(action: {
                        self.vm.closeAction()
                        
                    }) {
                        Text("Match me")
                            .foregroundColor(Color.white)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                        )
                    }
                    Spacer()
                }
            }.padding(15) //makes view content off the edges
                .background(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint).clipShape(RoundedRectangle(cornerRadius: 12.0))
                    .frame(width: geometry.size.width - 30 , height: geometry.size.height - 300)
                    .onAppear {
                        self.startPoint = UnitPoint(x: 1, y: -1)
                        self.endPoint = UnitPoint(x: 0, y: 1)
                }
                .animation(
                    Animation.easeIn(duration: 3)
                        .repeatForever(autoreverses: false)
                    )
            )
            
        }.background(
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
        )
    }
    
}

struct AlertSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSwiftUIView(vm: ViewModel())
    }
}



>>>>>>> Stashed changes
