//
//  RecommendedTripArray.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

public struct MockService {
    
    public let dataService: RecommendedTripArray
    
    public init() {
        self.dataService = RecommendedTripArray()
    }
}

public struct RecommendedTripArray {

	public var surfboardsBeginner: [Surfboard] = {
        return [Surfboard(level: "Beginner", volume: "50 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.5", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner", volume: "50 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner", volume: "60 L", imageName: "3.2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner", volume: "70 L", imageName: "4.2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
			]
    }()
	public var surfboardsBeginnerInter: [Surfboard] = {
        return [Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2.5", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "50 L", imageName: "2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "60 L", imageName: "3", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "70 L", imageName: "4", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "55 L", imageName: "5", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
        ]
    }()
	public var surfboardsIntermediate: [Surfboard] = {
        return [Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: " 1 - 3.4 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Intermediate", volume: "50 L", imageName: "inter2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Intermediate", volume: "60 L", imageName: "inter3", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
			]
    }()
	public var surfboardsAdvanced: [Surfboard] = {
        return [Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "1 - 4.4", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50), Surfboard(level: "Advanced", volume: "50 L", imageName: "pro", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50), Surfboard(level: "Advanced", volume: "50 L", imageName: "pro", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
			]
    }()
    public var surfboardsAreals: [Surfboard] = {
        return [Surfboard(level: "Areals", volume: "40 L", imageName: "3.3", weightUnit: "<", beaufortScaleWave: " 0 - 3.4 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 40),
                Surfboard(level: "Areals", volume: "40 L", imageName: "3.1", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 40),
                Surfboard(level: "Areals", volume: "40 L", imageName: "7", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 40)
        ]
    }()
    public var surfboardsLongboard: [Surfboard] = {
        return [Surfboard(level: "Longboarding", volume: "70 L", imageName: "6", weightUnit: "<", beaufortScaleWave: "0 - 1", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 70), Surfboard(level: "Longboarding", volume: "70 L", imageName: "7", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 70), Surfboard(level: "Longboarding", volume: "70 L", imageName: "5-2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 70)
        ]
    }()

    
    public var surfCountryBegginer: [Surfboard] = {
        return [
			Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "SA", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "morocco", weight: 50)
        ]
    }()
    
    public var surfCountryBI: [Surfboard] = {
          return [
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "France",continentName: "Surf Europe", imageFlag: "french", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50)
          ]
      }()
    
	public var surfCountryInter: [Surfboard] = {
		  return [
              Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "2 - 3 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "2 - 3 m", countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "2 - 3 m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "2 - 3 m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "2 - 3 m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "2 - 3 m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50)
		  ]
	  }()

	public var surfCountryAdvanced: [Surfboard] = {
		  return [
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "France",continentName: "Surf Europe", imageFlag: "french", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50)
		  ]
	  }()

    public var surfCountryAreals: [Surfboard] = {
        return [
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50)
        ]
    }()

    public var surfCountryLongoard: [Surfboard] = {
        return [
            Surfboard(level: "Longoard", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
            Surfboard(level: "Longoard", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
            Surfboard(level: "Longoard", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50)
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
            SurfTip(goal: "Performing full carving vertical movements",
                    description: "If a surfboarf needs to do a sharp turn to change direction, then the nose of the board will go up in order to pivot easily that is called carving.",
                    descriptionLocation: "Carves are the deeper, more radical turns. They are used to change direction rapidly and drastically. To do so, surfers need to apply more pressure on the back foot, slightly lifting the nose and making it possible to pivot the board using the fins and the rails. Many of the high-performance manoeuvres include a good carve. Example: Bottom Turns & Cutbacks.")
        ]
    }()

    public var tipAreals: [SurfTip] = {
        return [
            SurfTip(goal: "Performing areals above the waves",
                    description: "An aerial maneuver through which, thanks to the speed and technique, the surfer manages to “jump” out of the lip of the wave and then land inside it, on the foam or at the base.",
                    descriptionLocation: "Flight technique is the most important skill when it comes to aerials in surfing. The decisive moment arrives when your surfboard is about to leave the wave face. When you pop up off of the lip, your front foot should be in the center of the board, and your rear foot should be on the traction pad.")
        ]
    }()

    public var tipLongboarding: [SurfTip] = {
        return [
            SurfTip(goal: "Surfing with style and grace horizontal movements",
                    description: "Longboards are a go-to for beginner surfers learning how to surf. They allow you to easily catch small waves and whitewash, perfect your pop-up, and learn the basics of riding down the face.",
                    descriptionLocation: "Longboarders draw very different lines on a wave to shortboarders. This is one of the big things that differentiate the two. The lines a longboarder will surf are predominantly horizontal and down the line of a wave.")
        ]
    }()

}
