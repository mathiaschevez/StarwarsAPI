//
//  PlanetController.swift
//  starwarsAPI
//
//  Created by Mathias on 6/17/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation
import UIKit

struct stringConstants {
    fileprivate static let baseURLString = "https://swapi.dev/api"
    fileprivate static let planetURLString = "planets"
}

class PlanetController {
    static func fetchPlanets(completion: @escaping (Result<[Planet], PlanetError>) -> Void) {
        guard let baseURL = URL(string: stringConstants.baseURLString) else {return completion(.failure(.invalidURL))}
        let finalURL = baseURL.appendingPathComponent(stringConstants.planetURLString)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                return completion(.failure(.thrownError(error)))
            }
            guard let data = data else {return completion(.failure(.noData))}
            
            do {
                let topLevelObject = try JSONDecoder().decode(TopLevelObject.self, from: data)
                let secondLevelArray = topLevelObject.results
                
                var planetsPlaceHolderArray: [Planet] = []
                
                for planet in secondLevelArray {
                    planetsPlaceHolderArray.append(planet)
                    
                    completion(.success(planetsPlaceHolderArray))
                }
            } catch {
                return completion(.failure(.thrownError(error)))
            }
        }.resume()
    }
}
