//
//  AppData.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

struct RecommendedTrip {

    var surfCountry: [Location] = {
        return [
			Location(countryName: "France",continentName: "Europe", imageFlag: "seal1"),
            Location(countryName: "Costa Rica", continentName: "South America", imageFlag: ""),
            Location(countryName: "Morocco", continentName: "Africa", imageFlag: ""),
            Location(countryName: "Japan", continentName: "Asia", imageFlag: ""),
            Location(countryName: "California", continentName: "North America", imageFlag: ""),
            Location(countryName: "South Africa", continentName: "Africa", imageFlag: ""),
        ]
    }()

    var tips: [SurfTip] = {
        return [
            SurfTip(title: "Beginner surf goal",
                     description: "Biking is the best activity you can find. It's fun, it's sporty, and you can look kind of cool on a bike"),
            SurfTip(title: "SwiftIsland",
                     description: "This is a special one...."),
            SuSurfTip(title: "Running around",
                     description: "Running is not for everyone. But if it's for you, you're in luck! It's still slow enough so you can look around at the nature around"),
            Surfboard(title: "Petting the seals",
                     description: "Do you dare to do it? Is it even dangerous? Let's find out together!"),
            Surfboard(title: "Biking",
                     description: "Biking is the best activity you can find. It's fun, it's sporty, and you can look kind of cool on a bike")
        ]
    }()

    var coolLocations: [Surfboard] = {
        return [Surfboard(title: "The Lighthouse",volume: "",weight: 0,weightUnits: "", imageName: "spot4"),
				Surfboard(title: "The Lighthouse",volume: "",weight: 0,weightUnits: "", imageName: "spot4"),
				Surfboard(title: "The Lighthouse",volume: "",weight: 0,weightUnits: "", imageName: "spot4"),
				Surfboard(title: "The Lighthouse",volume: "",weight: 0,weightUnits: "", imageName: "spot4"),
				Surfboard(title: "The Lighthouse",volume: "",weight: 0,weightUnits: "", imageName: "spot4"),
				Surfboard(title: "The Lighthouse",volume: "",weight: 0,weightUnits: "", imageName: "spot4")
			]
    }()
}
