//
//  SurfStorage.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import  Foundation



// Provides surfing data from JSON
//*********************************************

struct SurfCache {
  let surfArray: [String]
  let surfDictionary: [String: String]
}

//class SurfStorage {
//
//  static let sharedStorage = SurfStorage()
//  static let surfURL = Bundle.main.url(forResource: "surf", withExtension: "json")!
//
//  private let allSurfFromJSON: SurfCache
//
//  init() {

    // Parse json and store it's data
//    let data = try! Data(contentsOf: SurfStorage.kanjiURL)
 //   let allSurf = try! JSONDecoder().decode([String].self, from: data)
//
//    let surfDictionary = allSurf.reduce([:]) { (dictionary, surf) -> [String: String] in
//      var dictionary = dictionary
//      dictionary[kanji.character] = surf
//      return dictionary
//    }

    // Save new cache
//    allSurfFromJSON = SurfCache(kanjiArray: allSurf, kanjiDictionary: surfDictionary)
//	super.init()
//  }

//  func allKanji() -> [String] {
//
//    return allSurfFromJSON.surfArray
//  }
//}
