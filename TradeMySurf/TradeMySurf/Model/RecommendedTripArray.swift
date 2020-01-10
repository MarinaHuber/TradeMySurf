//
//  RecommendedTripArray.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation
//TO DO: load this as a bundle: https://www.hackingwithswift.com/example-code/system/how-to-decode-json-from-your-app-bundle-the-easy-way


public struct Services {
    
    public let dataService: RecommendedTripArray
    
    public init() {
        self.dataService = RecommendedTripArray()
    }
}

public struct RecommendedTripArray {

	public var surfboardsBeginner: [Surfboard] = {
        return [Surfboard(title: "The Beginner", volume: "80 L", weight: 40, weightUnit: ">", imageName: "1.2"),
				Surfboard(title: "The Beginner", volume: "50 L", weight: 50, weightUnit: "<", imageName: "2.2"),
				Surfboard(title: "The Beginner", volume: "60 L", weight: 60, weightUnit: "<", imageName: "3.2"),
				Surfboard(title: "The Beginner", volume: "70 L", weight: 70, weightUnit: "<", imageName: "4.2")
			]
    }()
	public var surfboardsBeginnerInter: [Surfboard] = {
        return [Surfboard(title: "Beginner Inter", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "Beginner Inter", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "Beginner Inter", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "Beginner Inter", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "Beginner Inter", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "Beginner Inter", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
	public var surfboardsIntermediate: [Surfboard] = {
        return [Surfboard(title: "The Intermediate", volume: "40 L", weight: 40, weightUnit: ">", imageName: "bg-splash"),
				Surfboard(title: "The Intermediate", volume: "50 L", weight: 50, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Intermediate", volume: "60 L", weight: 60, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Intermediate", volume: "70 L", weight: 70, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Intermediate", volume: "55 L", weight: 80, weightUnit: "<", imageName: "bg-splash"),
				Surfboard(title: "The Intermediate", volume: "45 L", weight: 90, weightUnit: "<", imageName: "bg-splash")
			]
    }()
	public var surfboardsAdvanced: [Surfboard] = {
        return [Surfboard(title: "The Advanced", volume: "40 L", weight: 40, weightUnit: ">", imageName: "pro1"),
				Surfboard(title: "The Advanced", volume: "50 L", weight: 50, weightUnit: "<", imageName: "pro"),
                Surfboard(title: "The Advanced", volume: "50 L", weight: 50, weightUnit: "<", imageName: "pro1")
			]
    }()

    public var surfCountrySummer: [Location] = {
        return [
			Location(countryName: "Summer France", continentName: "Europe", imageFlag: "french", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Morocco", continentName: "Africa", imageFlag: "indonesia", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french", beaufortScaleWave: "0 - 1.5 m")
        ]
    }()
	public var surfCountryAutumn: [Location] = {
		  return [
              Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil", beaufortScaleWave: "1 - 1.4 m"),
			  Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "morocco", beaufortScaleWave: "1 - 2.4 m"),
			  Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco", beaufortScaleWave: "1 - 2.4 m"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "1 - 2.4 m"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "1 - 2.4 m"),
			  Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french", beaufortScaleWave: "1 - 2.4 m")
		  ]
	  }()

	public var surfCountryWinter: [Location] = {
		  return [
			  Location(countryName: "Winter Morocco",continentName: "Europe", imageFlag: "morocco", beaufortScaleWave: "2 - 1.4 m"),
			  Location(countryName: "CostaRica", continentName: "SouthAmerica", imageFlag: "brazil", beaufortScaleWave: "2 - 1.4m"),
			  Location(countryName: "Imsouanne Bay", continentName: "Africa", imageFlag: "usa", beaufortScaleWave: "2 - 1.4 m"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "2 - 3 m"),
			  Location(countryName: "Biscay Bay", continentName: "Africa", imageFlag: "french", beaufortScaleWave: "2 - 3.4 m")
		  ]
	  }()
	public var surfCountrySpring: [Location] = {
		  return [
			  Location(countryName: "Biscay Bay",continentName: "Europe", imageFlag: "brazil", beaufortScaleWave: "3 < m"),
			  Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "usa", beaufortScaleWave: "3 < m"),
			  Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco", beaufortScaleWave: "3 < m"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "3 < m"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "3 < m"),
			  Location(countryName: "South Africa", continentName: "Africa", imageFlag: "indonesia", beaufortScaleWave: "3 < m")
		  ]
	  }()
    
    public var tipBeginner: [SurfTip] = {
        return [
            SurfTip(title: "Learning to stand up in white water waves",
                    description: "Beginners should start out on a foam surfboard: They are from soft material and perfect for learning. Volumen is important element to consider when choosing a surfboard. More weight you have the more volume you need.",
                    descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. Just because you like the look of a beach doesn’t mean it will deliver the right waves for your ability. Do your research and watch the waves before you head out. There is no shame in moving to a beach with smaller waves or fewer crowds; it’s all about finding the right waves for your ability")
        ]
    }()
    
    public var tipBeginnerInter: [SurfTip] = {
         return [
             SurfTip(title: "Paddling out, dropping straight down the face of the wave",
                     description: "Volumen is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                     descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. Do your research and watch the waves before you head out.")
         ]
     }()
    
    public var tipIntermediate: [SurfTip] = {
        return [
            SurfTip(title: "Trimming down the middle line of the wave",
                    description: "Volume is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                   descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea and land")
        ]
    }()
    
    public var tipAdvanced: [SurfTip] = {
        return [
            SurfTip(title: "Performing full carving movements",
                    description: "Volume is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                    descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea")
        ]
    }()
    
    public var tipPro: [SurfTip] = {
        return [
            SurfTip(title: "Professional level, speed, power and flow maneuvers",
                    description: "Volumen is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                    descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea")
        ]
    }()
}
