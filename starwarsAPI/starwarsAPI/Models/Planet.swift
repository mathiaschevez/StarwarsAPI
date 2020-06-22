//
//  Planet.swift
//  starwarsAPI
//
//  Created by Mathias on 6/17/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import Foundation

struct TopLevelObject: Decodable {
    let results: [Planet]
}

struct Planet: Decodable {
    let name: String
    let diameter: String
    let population: String
}
