//
//  SurfStorage.swift
//  TradeMySurf
//
//  Created by Marina Huber on 10/8/19.
//  Copyright © 2019 Marina Huber. All rights reserved.
//
import  Foundation

struct Location: Hashable {
    var id: UUID = UUID()
    var countryName: String
	var continentName: String
    var imageFlag: String

	mutating func filteredBy<T>(date: T) {
		print("\(self.countryName) \(self.continentName)")
		print("\(date)")
		let monthsOfYear = 12
		switch monthsOfYear {
		case 0...2:
			print(Season.winter.rawValue)
		case 3...5:
			print("Spring")
		case 6...9:
			print("Summer")
		case 10...12:
			print("Autumn")
		default:
			print("Fallback option")
		}
	}
}

extension Location {

    internal func filterBySurfDate() -> Location? {

        return self
    }
}

