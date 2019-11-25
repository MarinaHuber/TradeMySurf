//
//  AppData.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct RecommendedTrip {

    var surfCountries: [Location] = {
        return [
			Location(countryName: "France",continentName: "Europe", imageFlag: "french"),
            Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil"),
            Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco"),
            Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia"),
            Location(countryName: "California", continentName: "North America", imageFlag: "usa"),
            Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french"),
        ]
    }()

    var tips: [SurfTip] = {
        return [
            SurfTip(title: "Beginner surf goal",
                     description: "Biking is the best activity you can find. It's fun, it's sporty, and you can look kind of cool on a bike"),
            SurfTip(title: "Reading the wave",
                     description: "This is a specially hard for beginners.")
        ]
    }()

    var surfboards: [Surfboard] = {
        return [Surfboard(title: "The Lighthouse", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The Longboard", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Carver", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Fish", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Shortboard", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Lighthouse", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
}
