//
//  PlanetError.swift
//  starwarsAPI
//
//  Created by Mathias on 6/17/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

enum PlanetError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "There was ann error with the url"
        case .thrownError(let error):
            return "There was an error: \(error) - \(error.localizedDescription)"
        case .noData:
            return "There was no data found"
        }
    }
}
