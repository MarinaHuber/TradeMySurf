
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
          if verticalSizeClass == .regular && horizontalSizeClass == .regular {
            // macOS or iPad without split view
              return GeometryReader { geometry in
                  VStack(alignment: .center, spacing: 15) {
                      Image(systemName: "checkmark")
                          .foregroundColor(Color.white)
                          .font(Font.system(.largeTitle).bold())
                          .padding(.top, 10)
                      Text("You have been matched for:")
                      .foregroundColor(Color.white)
                          .font(Font.system(.subheadline))
                          .multilineTextAlignment(.center)
                          .padding()
                      Text("\(self.selectedLevel ?? "")")
                          .foregroundColor(Color.white)
                          .font(Font.system(.title).bold())
                          .multilineTextAlignment(.center)
                          .lineLimit(4)
                          .padding(10)
                      Text("Surfing start: \(self.selectedDate?.dateAsString(style: .long) ?? "")")
                          .foregroundColor(Color.white)
                      Text("You are matched to surfboards and locations suitable for your level and date")
                          .foregroundColor(Color.white)
                          .multilineTextAlignment(.center)
                          .lineLimit(3)
                          .padding(5)
                      HStack {
                          Spacer()
                          SwiftUI.Button(action: {
                              self.vm.backAction()
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
                  }
                   .padding(30) //makes view content off the edges
                   .background(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: self.startPoint, endPoint: self.endPoint).clipShape(RoundedRectangle(cornerRadius: 12.0))
                   .frame(width: geometry.size.width - 200 , height: geometry.size.height / 3.0, alignment: .center)
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
          } else {
            return GeometryReader { geometry in
                VStack(alignment: .center, spacing: 10) {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color.white)
                        .font(Font.system(.largeTitle).bold())
                        .padding(.top, 10)
                    Text("You have been matched for:")
                    .foregroundColor(Color.white)
                        .font(Font.system(.subheadline))
                        .multilineTextAlignment(.center)
                        .padding()
                    Text("\(self.selectedLevel ?? "")")
                        .foregroundColor(Color.white)
                        .font(Font.system(.title).bold())
                        .multilineTextAlignment(.center)
                        .lineLimit(4)
                        .padding(10)
                    Text("Surfing start: \(self.selectedDate?.dateAsString(style: .long) ?? "")")
                        .foregroundColor(Color.white)
                    Text("You are matched to surfboards and locations suitable for your level and date")
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .padding(15)
                    HStack {
                        Spacer()
                        SwiftUI.Button(action: {
                            self.vm.backAction()
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
                 .frame(width: geometry.size.width - 30 , height: geometry.size.height / 1.5, alignment: .center)
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
    
}

struct AlertSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AlertSwiftUIView(vm: ViewModel())
    }
}


//GeometryReader { geometry in
//if geometry.size.height > geometry.size.width {
//       print("portrait")
//} else {
//       print("landscape")
//}

//return GeometryReader { geometry in
//  if geometry.size.width > 324.0/2.0 { // 40mm watch resolution in points
//    Text("BIG view here")
//  } else {
//    Text("small view here")
//  }
//}
