//
//  MapModel.swift
//  
//
//  Created by Marina Huber on 12/8/20.
//

import Foundation

//struct MapModel: Decodable {
//    let maps : [Map]
//}
//
//struct Map: Decodable {
//
//    struct Location: Decodable {
//        let lat, lng: Int
//    }
//    let title: String
//    let coordinates: Location
//    let address: String
//}
//
//extension Map {
//    enum CodingKeys: CodingKey {
//        case title
//        case coordinates
//        case address
//    }
//}

// MARK: - Welcome
struct MapModel: Codable {
    let results: [Results]

    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Results: Codable {

    let name: String


    enum CodingKeys: String, CodingKey {

        case name

    }
}





