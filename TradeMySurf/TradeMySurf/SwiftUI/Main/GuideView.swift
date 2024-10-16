//
//  GuideView.swift
//  TradeMySurf
//
//  Created by Marina Huber on 30.04.2024..
//  Copyright © 2024 Marina Huber. All rights reserved.
//

import Foundation
import SwiftUI

struct GuideView: View {
    @State private var showNext: Bool = false
    let data = [
        ("Title 1 Answer 1: This is the answer for title 1.", "Answer 1: This is the answer for title 1."),
        ("Title 2", "Answer 2: This is the answer for title 2."),
        ("Title 3", "Answer 3: This is the answer for title 3."),
        ("Title 4", "Answer 4: This is the answer for title 4."),
        ("Title 5 Answer 1: This is the answer for title 1. Answer 1: This is the answer for title 1.", "Answer 5: This is the answer for title 5."),
        ("Title 6", "Answer 6: This is the answer for title 6."),
        ("Title 7", "Answer 7: This is the answer for title 7."),
    ]
    @State private var expandedIndex: Int? = nil


    var body: some View {
        ZStack(alignment: .top) {
            MeshGradientView(
                width: 3,
                height: 3,
                colors: gradientColors,
                background: Color(UIColor(named: "pastelPrimary") ?? .purple)
            )
            VStack {
                CustomNavigationBar(ifMainView: false)
                List {
                    HStack {
                        Spacer() // Pushes the title to the center
                        Text("Surf FAQ")
                            .multilineTextAlignment(.center)
                        Spacer() // Pushes the title to the center
                    }
                    .padding(.top)

                    ForEach(data.indices, id: \.self) { index in
                        VStack(alignment: .leading) {
                            HStack {
                                Text(data[index].0) // Display title
                                    .font(.headline)
                                Spacer()
                                    // Toggle arrow icon based on expanded state
                                Image(systemName: expandedIndex == index ? "chevron.up" : "chevron.down")
                                    .rotationEffect(.degrees(expandedIndex == index ? 180 : 0))
                                    .foregroundColor(.gray)
                            }
                            .onTapGesture {
                                    // Toggle expansion state
                                withAnimation {
                                    expandedIndex = expandedIndex == index ? nil : index
                                }
                            }

                                // Display answer if the current index is expanded
                            if expandedIndex == index {
                                Text(data[index].1)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                    .padding(.top, 5)
                            }
                        }
                        .padding(.vertical, 5)
                        .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.inset)
                .clipShape(RoundedRectangle(cornerRadius: 10)) // Clips the list to the rounded shape
                .padding()

            }
        }
    }

    private var gradientColors: [Color] {
        [
            Color(red: 1.00, green: 0.42, blue: 0.42),
            Color(red: 1.00, green: 0.55, blue: 0.00),
            Color(red: 1.00, green: 0.27, blue: 0.00),
            Color(red: 1.00, green: 0.41, blue: 0.71),
            Color(red: 0.85, green: 0.44, blue: 0.84),
            Color(red: 0.54, green: 0.17, blue: 0.89),
            Color(red: 0.29, green: 0.00, blue: 0.51),
            Color(red: 0.00, green: 0.00, blue: 0.55),
            Color(red: 0.10, green: 0.10, blue: 0.44)
        ]
    }
}
