//
//  ApiMapsRequest.swift
//  TradeMySurf
//
//  Created by Marina Huber on 12/8/20.
//  Copyright © 2020 Marina Huber. All rights reserved.
//
import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}

struct ApiMapsRequest {
    // MARK: - Properties
    
     static let client = ApiMapsRequest()
    
    // MARK: - Initializer private
     private init() {}
    
    // MARK: - Requests
    func request<T: Decodable>(_ endpoint: Endpoint, model: T.Type, completion: @escaping (Result<T, APIServiceError>) -> ()) {
        guard let url = endpoint.url else {
            return completion(.failure(.responseError))
        }
            
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let _ = error {
                completion(.failure(.responseError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.responseError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.responseError))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .iso8601
                let model = try decoder.decode(T.self, from: data)
                
                completion(.success(model))
            } catch {
                completion(.failure(.parseError(error)))
            }
        }
        task.resume()
    }
  //  }
}
