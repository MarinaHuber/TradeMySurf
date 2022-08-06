//
//  ApiEndpoint.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/8/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//

import Foundation

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func search(matching query: String) -> Endpoint {
        return Endpoint(
            path: "/maps/api/place/textsearch/json",
            queryItems: [
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "key", value: Keys.publicKey)
            ]
        )
    }
}
extension Endpoint {
    var url: URL? {
        var components        = URLComponents()
        components.scheme     = "https"
        components.host       = "maps.googleapis.com"
        components.path       = path
        components.queryItems = queryItems
        return components.url
    }
}

