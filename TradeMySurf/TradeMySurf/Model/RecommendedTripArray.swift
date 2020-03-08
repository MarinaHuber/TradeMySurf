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
        return [Surfboard(level: "The Beginner", volume: "80 L", imageName: "1.2", weight: 40, weightUnit: ">", beaufortScaleWave: "0 - 1.4 m"),
                Surfboard(level: "The Beginner", volume: "50 L", imageName: "2.2", weight: 50, weightUnit: "<", beaufortScaleWave: " 0 - 1.4 m"),
                Surfboard(level: "The Beginner", volume: "60 L", imageName: "3.2", weight: 60, weightUnit: "<", beaufortScaleWave: " 0 - 1.4 m"),
                Surfboard(level: "The Beginner", volume: "70 L", imageName: "4.2", weight: 70, weightUnit: "<", beaufortScaleWave: " 0 - 1.4 m")
			]
    }()
	public var surfboardsBeginnerInter: [Surfboard] = {
        return [Surfboard(level: "Beginner Inter", volume: "40 L", imageName: "1", weight: 40, weightUnit: ">", beaufortScaleWave: "1 - 1.4 m"),
                Surfboard(level: "Beginner Inter", volume: "50 L", imageName: "2", weight: 50, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m"),
                Surfboard(level: "Beginner Inter", volume: "60 L", imageName: "3", weight: 60, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m"),
                Surfboard(level: "Beginner Inter", volume: "70 L", imageName: "4", weight: 70, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m"),
                Surfboard(level: "Beginner Inter", volume: "55 L", imageName: "5", weight: 80, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m")
        ]
    }()
	public var surfboardsIntermediate: [Surfboard] = {
        return [Surfboard(level: "The Intermediate", volume: "40 L", imageName: "inter1", weight: 40, weightUnit: ">", beaufortScaleWave: "2 - 2.4 m"),
                Surfboard(level: "The Intermediate", volume: "50 L", imageName: "inter2", weight: 50, weightUnit: "<", beaufortScaleWave: "2 - 2.4 m"),
                Surfboard(level: "The Intermediate", volume: "60 L", imageName: "inter3", weight: 60, weightUnit: "<", beaufortScaleWave: "2 - 2.4 m")
			]
    }()
	public var surfboardsAdvanced: [Surfboard] = {
        return [Surfboard(level: "The Advanced", volume: "40 L", imageName: "pro1", weight: 40, weightUnit: ">", beaufortScaleWave: "3 > m"),
                Surfboard(level: "The Advanced", volume: "50 L", imageName: "pro", weight: 50, weightUnit: "<", beaufortScaleWave: "3 > m"),
                Surfboard(level: "The Advanced", volume: "50 L", imageName: "pro1", weight: 50, weightUnit: "<", beaufortScaleWave: "3 > m")
			]
    }()

    
    
    
    public var surfCountrySummer: [Location] = {
        return [
			Location(countryName: "Summer France", continentName: "Europe", imageFlag: "french", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Morocco", continentName: "Africa", imageFlag: "indonesia", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french", beaufortScaleWave: "0 - 1.4 m")
        ]
    }()
    
    public var surfCountrySpring: [Location] = {
          return [
              Location(countryName: "Biscay Bay",continentName: "Europe", imageFlag: "brazil", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "usa", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "South Africa", continentName: "Africa", imageFlag: "indonesia", beaufortScaleWave: "1 - 1.4 m")
          ]
      }()
    
	public var surfCountryAutumn: [Location] = {
		  return [
              Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "brazil", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "Costa Rica", continentName: "South America", imageFlag: "morocco", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "Morocco", continentName: "Africa", imageFlag: "morocco", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "South Africa", continentName: "Africa", imageFlag: "french", beaufortScaleWave: "2 - 2.4 m")
		  ]
	  }()

	public var surfCountryWinter: [Location] = {
		  return [
			  Location(countryName: "Winter Morocco",continentName: "Europe", imageFlag: "morocco", beaufortScaleWave: "3 > m"),
			  Location(countryName: "CostaRica", continentName: "SouthAmerica", imageFlag: "brazil", beaufortScaleWave: "3 > m"),
			  Location(countryName: "Imsouanne Bay", continentName: "Africa", imageFlag: "usa", beaufortScaleWave: "3 > m"),
			  Location(countryName: "Japan", continentName: "Asia", imageFlag: "indonesia", beaufortScaleWave: "3 > m"),
			  Location(countryName: "California", continentName: "North America", imageFlag: "usa", beaufortScaleWave: "3 > m"),
			  Location(countryName: "Biscay Bay", continentName: "Africa", imageFlag: "french", beaufortScaleWave: "3 > m")
		  ]
	  }()
    
    public var tipBeginner: [SurfTip] = {
        return [
            SurfTip(goal: "Learning to stand up in white water waves",
                    description: "Beginners should start out on a foam surfboard: They are from soft material and perfect for learning. Volumen is important element to consider when choosing a surfboard. More weight you have the more volume you need.",
                    descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. Just because you like the look of a beach doesn’t mean it will deliver the right waves for your ability. Do your research and watch the waves before you head out. There is no shame in moving to a beach with smaller waves or fewer crowds; it’s all about finding the right waves for your ability")
        ]
    }()
    
    public var tipBeginnerInter: [SurfTip] = {
         return [
             SurfTip(goal: "Paddling out, dropping straight down the face of the wave",
                     description: "Volumen is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                     descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. Do your research and watch the waves before you head out.")
         ]
     }()
    
    public var tipIntermediate: [SurfTip] = {
        return [
            SurfTip(goal: "Trimming down the middle line of the wave",
                    description: "Volume is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                   descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea and land")
        ]
    }()
    
    public var tipAdvanced: [SurfTip] = {
        return [
            SurfTip(goal: "Performing full carving movements",
                    description: "Volume is important element to consider when choosing a surfboard. It's the factor that can most affect the number of waves you catch, and how much fun you have in water.But it isn't everything. Understanding how the curved shapes and the surfboard's dimensions affect your surfing will also help you find better surfboardsfor your surf level, and have positive impact on your progression.",
                    descriptionLocation: "Beaufort scale measure is important element to consider when choosing a surf location. It's the factor that can most affect the size and the power of waves in water. But it isn't everything. Understanding the scale ranging from 0-17 is understanding the global wind speed to observed conditions at sea")
        ]
    }()

}
