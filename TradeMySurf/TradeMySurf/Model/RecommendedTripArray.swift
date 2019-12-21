//
//  RecommendedTripArray.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
//TO DO: load this as a bundle: https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way

struct RecommendedTripArray {

	var surfboardsBeginner: [Surfboard] = {
        return [Surfboard(title: "The Beginner", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The Beginner", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Carver", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Fish", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Shortboard", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Lighthouse", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
	var surfboardsBeginnerInter: [Surfboard] = {
        return [Surfboard(title: "The BeginnerInter", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The BeginnerInter", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Carver", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Fish", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Shortboard", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Lighthouse", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
	var surfboardsIntermediate: [Surfboard] = {
        return [Surfboard(title: "The Intermediate", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The Intermediate", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Carver", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Fish", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Shortboard", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Lighthouse", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
	var surfboardsAdvanced: [Surfboard] = {
        return [Surfboard(title: "The Advanced", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The Advanced", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Carver", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Fish", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Shortboard", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Lighthouse", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
	var surfboardsPro: [Surfboard] = {
        return [Surfboard(title: "The Pro", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The Pro", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Carver", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Fish", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Shortboard", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Lighthouse", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()

    var surfCountrySummer: [Location] = {
        return [
			Location(countryName: "Summer France",continentName: "Europe", imageFlag: "french"),
            Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil"),
            Location(countryName: "Morocco", continentName: "Africa", imageFlag: "indonesia"),
            Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia"),
            Location(countryName: "California", continentName: "North America", imageFlag: "usa"),
            Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french")
        ]
    }()
	var surfCountryAutumn: [Location] = {
		  return [
              Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil"),
			  Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "morocco"),
			  Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa"),
			  Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french")
		  ]
	  }()

	var surfCountryWinter: [Location] = {
		  return [
			  Location(countryName: "Winter Morocco",continentName: "Europe", imageFlag: "morocco"),
			  Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil"),
			  Location(countryName: "Morocco", continentName: "Africa", imageFlag: "usa"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa"),
			  Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french")
		  ]
	  }()
	var surfCountrySpring: [Location] = {
		  return [
			  Location(countryName: "Spring France",continentName: "Europe", imageFlag: "brazil"),
			  Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "usa"),
			  Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa"),
			  Location(countryName: "South Africa", continentName: "Africa", imageFlag: "indonesia")
		  ]
	  }()

    var tips: [SurfTip] = {
        return [
            SurfTip(title: "Beginner surf goal",
                     description: "Volumen is the most important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression."),
//            SurfTip(title: "Reading the wave",
//                     description: "This is a specially hard for beginners.")
        ]
    }()
}
