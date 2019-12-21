
### Recommendation iOS/Swift project from surfers to surfers
![alt tag](https://img.shields.io/badge/swift%205-Surfo%20project-blue)

Survey by surfers:
https://docs.google.com/forms/d/e/1FAIpQLSdzwVMycAc3ISaFck8lxFKnC8e5i4BmnzlVo_N9-Z0lRCYeJg/viewform?usp=sf_link

Presentation: https://docs.google.com/presentation/d/1hmtwfkfkYBY4rAdn2Nz3Hf__6SqDF5T0Yd6LlU8GkVY/edit?usp=sharing

📌  As of November 2019, this project requires Xcode 11+ (Swift 5.0)
### Publish on: - - not jet
### Deployed for: iOS 13

# Why did you undertake the project?
This was a long passion of mine and I was lucky enough to get a mentorship through a Import Foundation programme where I presented my vague idea at the time. This led me to wonderful collaborations and learning path. Here is the result of Beta V1.0. surf app. It was created from idea: help surfers to learn from surf goals and expectations. Adding value to surf hobby by that extra planning, it is a developers approach to surfing.

# Scope / User story
As a surfer I want to set clear my surf goal. To accomplish this goal I need a correct sufboard and a location. I choose a level in the app and the date of expected surf and than the app opens the recommended boards and locations. As a surfer I want to buy a new or second hand surfboard but I do not know what kind would be useful for me. I tap claculator and see the choices I have for range I can spend.

# Used Libraries
 CoreML
 
 SwiftyPickerPopover
 
 SwiftLint
 
 Lottie

# Technologies / Stack used
###  Navigation scheme: MVC + Coordinator pattern
Illustrates flow of the app:

 + LoadingState screen
 + Welcome screen
 + Add level flow
 + Add date flow
 + TabBar Main Coordinator
 + Recommendations for trip
 + Previous trips - (check wish list)
 + Calculator for board prices
![alt tag](https://pbs.twimg.com/media/EGN6v1YWwAEa2bc?format=jpg&name=large)

###  Linear Regression
CoreML and prediction model for the surfboard prices

# List of features

 + Recommended surfboards (volume,shape,size) for the user level 
 + Recommended country locations for season and level
 + Preditions for used or new surfboard current market price

# Lessons learned
- How simple is to use CoreML and how hard itis to test the model
- The exciting thing about this work is that I had no idea where it would take me. I knew I needed to use Coordinator pattern and 
that I would not be using a backend for the first version of the app (only mocks).
- I learned how to focus on one main priority thing, and reduce the complexity.
- Building MVP from scratch, kickstart idea-design-tech stack and implementation of it.
- Don't mix SwiftUI with AutoLayout
- App Store upload process

# Wish list
- Save the recommended surf trips into a storage (local or cloud)
- Show map from recommended countries with map annotations for surf shops/camps
- Add details to surfboard collection view
- Implement tests for model and UI - automatisation

# Installation
Download the project.

Open the terminal and navigate to the directory of project ```cd TradeMySurf```.

Install Dependencies with Cocoapods ```pod install```.

Open the workspace open ```TradeMySurf.xcworkspace```.

# Credits
 + help from Import Foundation project.



*This GitHub Page and Project is in development so It will be changing frequently.*
I created a [Trello](https://trello.com/b/PD4vhnSl/trade-my-surf) to try to organize myself with everything I would like to develop for this App.

I would be happy to have suggestions that you can do in the BackLog tab

Thanks to read and be interest to this project.


