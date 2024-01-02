
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
    var backAction: () -> Void = {}
}

struct AlertSwiftUIView: View {
    
    @State private var selectedDate = UserDefaults.standard.surfingTime
    @State private var selectedLevel = UserDefaults.standard.selectedLevel
    @State private var levels = [Level.Beginner.rawValue, Level.BeginnerIntermediate.rawValue, Level.Intermediate.rawValue, Level.Advanced.rawValue]
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var vm: ViewModel
    @State private var gradient = [Color.red, Color.blue, Color.gray]
    @State private var startPoint = UnitPoint(x: 0, y: 0)
    @State private var endPoint = UnitPoint(x: 0, y: 2)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                //optimize with Group
                Image(systemName: "checkmark")
                    .foregroundColor(Color.white)
                    .font(Font.system(.largeTitle).bold())
                    .padding(.top, 10)
                Text("You have been matched for:")
                    .foregroundColor(Color.white)
                    .font(Font.system(.subheadline))
                    .padding()
                Text("\(self.selectedLevel ?? "")")
                    .foregroundColor(Color.white)
                    .font(Font.system(.title).bold())
                    .multilineTextAlignment(.center)
                    .lineLimit(4)
                    .padding(10)
                Text("Surfing start: \(self.selectedDate?.dateAsString(style: .long) ?? "")")
                    .foregroundColor(Color.white)
                Text("Surfboards and locations for your level matched")
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .padding(10)
                AlertButtonView(vm: vm)
            }
            .frame(maxWidth: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint)
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
                .onAppear {
                    self.startPoint = UnitPoint(x: 1, y: -1)
                    self.endPoint = UnitPoint(x: 0, y: 1)
                }
                .animation(
                    Animation.easeIn(duration: 3)
                        .repeatForever(autoreverses: false)
                )
            )
        }
        .frame(width: 300, height: 500, alignment: .center)

    }
}

struct AlertSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSwiftUIView(vm: ViewModel())
    }
}