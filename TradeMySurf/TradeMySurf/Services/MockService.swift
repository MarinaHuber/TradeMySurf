//
//  RecommendedTripArray.swift
//  TradeMySurf
//
//  Created by Marina Huber on 11/24/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//

import Foundation

public struct MockService {
    
    let dataService: RecommendedTripArray

    public init() {
        self.dataService = RecommendedTripArray()
    }
}

class RecommendedTripArray {

	lazy var surfboardsBeginner: [Surfboard] = {
        return [Surfboard(level: "Beginner", volume: "50 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.5", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner", volume: "50 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 40),
                Surfboard(level: "Beginner", volume: "60 L", imageName: "3.2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner", volume: "70 L", imageName: "4.2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
			]
    }()
    lazy var surfboardsBeginnerInter: [Surfboard] = {
        return [Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2.5", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "50 L", imageName: "2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "60 L", imageName: "3", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
                Surfboard(level: "Beginner-Intermediate", volume: "70 L", imageName: "4", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
        ]
    }()
    lazy var surfboardsIntermediate: [Surfboard] = {
        return [Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: " 1 - 3.4 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 30),
                Surfboard(level: "Intermediate", volume: "50 L", imageName: "inter2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 40),
                Surfboard(level: "Intermediate", volume: "60 L", imageName: "inter3", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50)
			]
    }()
    lazy var surfboardsAdvanced: [Surfboard] = {
        return [Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "1 - 4.4", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 20), Surfboard(level: "Advanced", volume: "50 L", imageName: "pro", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 40), Surfboard(level: "Advanced", volume: "50 L", imageName: "pro", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 30)
			]
    }()
    lazy var surfboardsAreals: [Surfboard] = {
        return [Surfboard(level: "Areals", volume: "40 L", imageName: "3.3", weightUnit: "<", beaufortScaleWave: " 0 - 3.4 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 10),
                Surfboard(level: "Areals", volume: "40 L", imageName: "3.1", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 20),
                Surfboard(level: "Areals", volume: "40 L", imageName: "7", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 20)
        ]
    }()
    lazy var surfboardsLongboard: [Surfboard] = {
        return [Surfboard(level: "Longboarding", volume: "70 L", imageName: "6", weightUnit: "<", beaufortScaleWave: "0 - 1", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 70), Surfboard(level: "Longboarding", volume: "70 L", imageName: "7", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 70), Surfboard(level: "Longboarding", volume: "70 L", imageName: "5-2", weightUnit: "<", beaufortScaleWave: "", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 70)
        ]
    }()

/* ================================ */


    lazy var surfCountryBegginer: [Surfboard] = {
        return [
			Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.5 m", countryName: "Croatia", continentName: "Sunshine and baby waves", imageFlag: "cro", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.5 m", countryName: "Portugal", continentName: "South Europe sun", imageFlag: "portug", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.5 m", countryName: "Morocco", continentName: "Africa sand beach", imageFlag: "morocco", weight: 50),
            Surfboard(level: "Beginner", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.5 m", countryName: "France", continentName: "Small wave retreats", imageFlag: "french", weight: 50)
        ]
    }()
    
    lazy var surfCountryBI: [Surfboard] = {
          return [
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Portugal",continentName: "Surf Europe", imageFlag: "portug", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Croatia", continentName: "Surf and wind", imageFlag: "cro", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "0 - 1.4 m", countryName: "Brasil", continentName: "Beginners waves", imageFlag: "brazil", weight: 50),
              Surfboard(level: "Beginner-Intermediate", volume: "40 L", imageName: "1", weightUnit: "<", beaufortScaleWave: "1 - 2 m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50)
          ]
      }()
    
    lazy var surfCountryInter: [Surfboard] = {
		  return [
              Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "1 - 3 m", countryName: "France", continentName: "Surf Europe", imageFlag: "french", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "1 - 3 m", countryName: "Portugal", continentName: "Surf intermedium", imageFlag: "portug", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "1 - 3 m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "1 - 3 m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "1 - 3 m", countryName: "Croatia", continentName: "Surf wind", imageFlag: "cro", weight: 50),
			  Surfboard(level: "Intermediate", volume: "40 L", imageName: "inter1", weightUnit: "<", beaufortScaleWave: "1 - 3 m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50)
		  ]
	  }()

    lazy var surfCountryAdvanced: [Surfboard] = {
		  return [
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "South Africa", continentName: "Advanced surfing retreats", imageFlag: "SA", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Bali", continentName: "Comminuty for surfers Pro", imageFlag: "indonesia", weight: 50),
              Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Brazil", continentName: "Big wave surf", imageFlag: "brazil", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Hawaii", continentName: "Locations for communities", imageFlag: "usa", weight: 50),
			  Surfboard(level: "Advanced", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Morocco", continentName: "Fun pointbreaks", imageFlag: "morocco", weight: 50)
		  ]
	  }()

    lazy var surfCountryAreals: [Surfboard] = {
        return [
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Brazil", continentName: "Surf Latin America", imageFlag: "brazil", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "South Africa", continentName: "Surf Africa", imageFlag: "SA", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50),
            Surfboard(level: "Areals", volume: "40 L", imageName: "2.2", weightUnit: "<", beaufortScaleWave: "3 > m", countryName: "South Africa", continentName: "Pro surf", imageFlag: "SA", weight: 50)
        ]
    }()

    lazy var surfCountryLongoard: [Surfboard] = {
        return [
            Surfboard(level: "Longoard", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "1 > m", countryName: "Bali", continentName: "Surf Asia", imageFlag: "indonesia", weight: 50),
            Surfboard(level: "Longoard", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "1 > m", countryName: "Hawaii", continentName: "Surf North America", imageFlag: "usa", weight: 50),
            Surfboard(level: "Longoard", volume: "40 L", imageName: "pro1", weightUnit: "<", beaufortScaleWave: "1 > m", countryName: "Morocco", continentName: "Surf Africa", imageFlag: "morocco", weight: 50)
        ]
    }()

/* ================================ */

    lazy var tipBeginner: [SurfTip] = {
        return [
            SurfTip(goal: "Get vitamin D and negative ions from waves",
                    description: "Learning to stand up on whitewater waves is one of the best ways to soak up sunshine and positive ions. Beginners should start with a foam surfboard and small whitewater waves, which are broken waves that belong to the fourth stage of the wave journey",
                    descriptionLocation: "Surfers always wear sunscreen and zinc for sun protection. The size of your surfboard is also an important factor to consider—larger boards with more weight and volume make it easier to catch more wave")
        ]
    }()
    
    lazy var tipBeginnerInter: [SurfTip] = {
         return [
             SurfTip(goal: "Improve cardiovascular health",
                     description: "A proper pop-up and surfboard stance, often in colder water, are key to unlocking both your surfing and health potential. Paddling out and dropping down the face of the wave provide an excellent cardiovascular workout. With the right technique, you’ll improve your balance and become more comfortable shifting your foot weight forward, backward, and sideways.",
                     descriptionLocation: "Position yourself to find, catch, and ride unbroken 'green' waves for the best experience.")
         ]
     }()
    
    lazy var tipIntermediate: [SurfTip] = {
        return [
            SurfTip(goal: "Reduce stress and anxiety",
                    description: "Surfing helps lower stress at any skill level, but for intermediate surfers, it often brings a common sense of calm.",
                   descriptionLocation: "When a surfboard needs to turn at high speed, the nose stays closer to the water, resulting in a less sharp turn. This technique is called trimming. Trimming along the middle line of the wave helps reduce anxiety and depression. Surfers 'trim' to adjust to the shape of the wave, shifting slightly higher or lower along the wave's edge. However, trimming is not used to change direction.")
        ]
    }()
    
    lazy var tipAdvanced: [SurfTip] = {
        return [
            SurfTip(goal: "Become part of community",
                    description: "While you don’t need to be part of a community to enjoy surfing, advanced surfers often find themselves connected to multiple surfing communities around the world. These surfers often engage with locals, performing full carving vertical movements in unison.",
                    descriptionLocation: "Carving refers to making sharp turns on a surfboard to change direction. When a surfer needs to make a quick directional change, the nose of the board lifts, allowing the board to pivot more easily. Carves are deeper, more radical turns that allow surfers to change direction rapidly and dramatically. To carve effectively, surfers must apply more pressure on the back foot, slightly lifting the nose to enable the board to pivot using its fins and rails. Many high-performance maneuvers, such as bottom turns and cutbacks, incorporate a solid carve.")
        ]
    }()

    lazy var tipAreals: [SurfTip] = {
        return [
            SurfTip(goal: "Build core strenght",
                    description: "All aspects of surfing require strong core muscles. Performing aerials above the waves is a challenge that combines strength and technique. An aerial maneuver allows the surfer, using speed and precision, to “jump” off the lip of the wave and land back on the foam or at its base. Mastering flight technique is essential for executing aerials in surfing.",
                    descriptionLocation: "Flight technique is the most important skill when it comes to aerials in surfing. The decisive moment arrives when your surfboard is about to leave the wave face. When you pop up off of the lip, your front foot should be in the center of the board, and your rear foot should be on the traction pad.")
        ]
    }()

    lazy var tipLongboarding: [SurfTip] = {
        return [
            SurfTip(goal: "Build confidence",
                    description: "Surfing is known for giving a confidence boost after a session in the ocean. Longboards are a popular choice for both beginner and advanced surfers. They make it easier to catch small waves and whitewash, practice your pop-up, and master the fundamentals of riding down the wave face.",
                    descriptionLocation: "One major difference between longboarders and shortboarders is the lines they draw on a wave. Longboarders tend to surf in predominantly horizontal lines, flowing down the length of the wave, while shortboarders focus on sharper, more vertical maneuvers.")
        ]
    }()

}
