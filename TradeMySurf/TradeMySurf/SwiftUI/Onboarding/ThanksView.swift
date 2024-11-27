//
//  ThanksView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 27.11.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import SwiftUI

struct ThanksView: View {
    @State private var isUserHere = false

    
    var body: some View {
        VStack(spacing: 20) {
                // Header with profile picture
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("✨ Thank you! ✨")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black)
                    Text("It’s great having you as a customer.")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "person.circle") // Replace with the actual image asset
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 1))
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .top)

                // Main Text
            Group {
                Text("I built Life: Just one from the ground up and I really enjoyed it!")
                Text("I can ensure you: I don’t serve ads, I don’t mine your data, and I protect your privacy.")
                Text("If you have any questions or need assistance, please don’t hesitate to reach out to me via email at:")
            }
            .font(.system(size: 16))
            .foregroundColor(.black)
            .multilineTextAlignment(.leading)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)

                // Email and Social
            HStack {
                Text("julien@lacroix.dev")
                    .font(.system(size: 16))
                    .foregroundColor(.blue)
                    .underline()
                Spacer()
                Text("@JulienLacr0ix")
                    .font(.system(size: 16))
                    .foregroundColor(.blue)
                    .underline()
            }
            .padding(.horizontal)

                // Signature
            Group {
                Text("Julien Lacroix,")
                    .font(.system(size: 18, weight: .bold))
                Text("Maker of Pomodoro Timer & Life: Just One")
                    .font(.system(size: 16))
                    .foregroundColor(.blue)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)

                // Button
            Button(action: {
                isUserHere.toggle()
            }) {
                Text("Let’s go!")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .frame(maxHeight: 80) // Control button height
            .fullScreenCover(isPresented: $isUserHere) {
                WelcomeView()
            }

        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.pastelSecondary)
    }
}


struct ThankYouView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView()
    }
}

