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
        return [Surfboard(level: "Beginner", volume: "80 L", imageName: "1.2", weight: 40, weightUnit: ">", beaufortScaleWave: "0 - 1.4 m"),
                Surfboard(level: "Beginner", volume: "50 L", imageName: "2.2", weight: 50, weightUnit: "<", beaufortScaleWave: " 0 - 1.4 m"),
                Surfboard(level: "Beginner", volume: "60 L", imageName: "3.2", weight: 60, weightUnit: "<", beaufortScaleWave: " 0 - 1.4 m"),
                Surfboard(level: "Beginner", volume: "70 L", imageName: "4.2", weight: 70, weightUnit: "<", beaufortScaleWave: " 0 - 1.4 m")
			]
    }()
	public var surfboardsBeginnerInter: [Surfboard] = {
        return [Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weight: 40, weightUnit: ">", beaufortScaleWave: "1 - 1.4 m"),
                Surfboard(level: "Beginner-Intermediate", volume: "50 L", imageName: "2", weight: 50, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m"),
                Surfboard(level: "Beginner-Intermediate", volume: "60 L", imageName: "3", weight: 60, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m"),
                Surfboard(level: "Beginner-Intermediate", volume: "70 L", imageName: "4", weight: 70, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m"),
                Surfboard(level: "Beginner-Intermediate", volume: "55 L", imageName: "5", weight: 80, weightUnit: "<", beaufortScaleWave: " 1 - 1.4 m")
        ]
    }()
	public var surfboardsIntermediate: [Surfboard] = {
        return [Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weight: 40, weightUnit: ">", beaufortScaleWave: "2 - 2.4 m"),
                Surfboard(level: "Intermediate", volume: "50 L", imageName: "inter2", weight: 50, weightUnit: "<", beaufortScaleWave: "2 - 2.4 m"),
                Surfboard(level: "Intermediate", volume: "60 L", imageName: "inter3", weight: 60, weightUnit: "<", beaufortScaleWave: "2 - 2.4 m")
			]
    }()
	public var surfboardsAdvanced: [Surfboard] = {
        return [Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weight: 40, weightUnit: ">", beaufortScaleWave: "3 > m"),
                Surfboard(level: "Advanced", volume: "50 L", imageName: "pro", weight: 50, weightUnit: "<", beaufortScaleWave: "3 > m"),
                Surfboard(level: "Advanced", volume: "50 L", imageName: "pro1", weight: 50, weightUnit: "<", beaufortScaleWave: "3 > m")
			]
    }()

    
    
    
    public var surfCountrySummer: [Location] = {
        return [
			Location(countryName: "Biscay Bay", continentName: "Surf Europe", imageFlag: "french", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Morocco", continentName: "Surf Africa", imageFlag: "SA", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "California", continentName: "Surf North America", imageFlag: "usa", beaufortScaleWave: "0 - 1.4 m"),
            Location(countryName: "South Africa", continentName: "Surf Africa", imageFlag: "morocco", beaufortScaleWave: "0 - 1.4 m")
        ]
    }()
    
    public var surfCountrySpring: [Location] = {
          return [
              Location(countryName: "Biscay Bay",continentName: "Surf Europe", imageFlag: "french", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "California", continentName: "Surf North America", imageFlag: "usa", beaufortScaleWave: "1 - 1.4 m"),
              Location(countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", beaufortScaleWave: "1 - 1.4 m")
          ]
      }()
    
	public var surfCountryAutumn: [Location] = {
		  return [
              Location(countryName: "Biscay Bay", continentName: "Surf Europe", imageFlag: "french", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "California", continentName: "Surf North America", imageFlag: "usa", beaufortScaleWave: "2 - 2.4 m"),
			  Location(countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", beaufortScaleWave: "2 - 2.4 m")
		  ]
	  }()

	public var surfCountryWinter: [Location] = {
		  return [
			  Location(countryName: "Biscay Bay",continentName: "Surf Europe", imageFlag: "french", beaufortScaleWave: "3 > m"),
			  Location(countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", beaufortScaleWave: "3 > m"),
			  Location(countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", beaufortScaleWave: "3 > m"),
			  Location(countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", beaufortScaleWave: "3 > m"),
			  Location(countryName: "California", continentName: "Surf North America", imageFlag: "usa", beaufortScaleWave: "3 > m"),
			  Location(countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", beaufortScaleWave: "3 > m")
		  ]
	  }()
    
    public var tipBeginner: [SurfTip] = {
        return [
            SurfTip(goal: "Learning to stand up in white water waves",
                    description: "White water waves are broken waves they belong to the fourth stage of the wave shape. Beginners should start out on a foam surfboard made of soft material and good for learning.",
                    descriptionLocation: "Volumen is important element to consider when choosing a surfboard. More weight you have the more volume you need and more waves you can catch.")
        ]
    }()
    
    public var tipBeginnerInter: [SurfTip] = {
         return [
             SurfTip(goal: "Paddling out, dropping down the face of the wave",
                     description: "A proper pop-up and surf stance is one of the keys to unlocking your surfing potential. With the proper technique, you will gain more balance and you will be comfortable shifting weight forwards, backwards and sideways.",
                     descriptionLocation: "Position yourself to find, catch & stick on unbroken “green” waves.")
         ]
     }()
    
    public var tipIntermediate: [SurfTip] = {
        return [
            SurfTip(goal: "Trimming down the middle line of the wave",
                    description: "If a surfboard needs to turn at high speed, the nose will stay closer to the water and the turn will be less sharp that is called trimming",
                   descriptionLocation: "Surfers “trim” in order to adjust to the shape of a wave, going slightly higher or lower to wave edge. Trimming can’t be used to change direction.")
        ]
    }()
    
    public var tipAdvanced: [SurfTip] = {
        return [
            SurfTip(goal: "Performing full carving movements",
                    description: "If a surfboarf needs to do a sharp turn to change direction, then the nose of the board will go up in order to pivot easily that is called carving.",
                    descriptionLocation: "Carves are the deeper, more radical turns. They are used to change direction rapidly and drastically. To do so, surfers need to apply more pressure on the back foot, slightly lifting the nose and making it possible to pivot the board using the fins and the rails. Many of the high-performance manoeuvres include a good carve. Example: Bottom Turns & Cutbacks.")
        ]
    }()

}
