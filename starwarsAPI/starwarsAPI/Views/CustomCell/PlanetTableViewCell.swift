//
//  PlanetTableViewCell.swift
//  starwarsAPI
//
//  Created by Mathias on 6/17/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class PlanetTableViewCell: UITableViewCell {
 
    @IBOutlet weak var planetNameLabel: UILabel!
    @IBOutlet weak var planetDiameterLabel: UILabel!
    @IBOutlet weak var planetPopulationLabel: UILabel!
    
    var planet: Planet? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let planet = planet else {return}
        planetNameLabel.text = planet.name
        planetDiameterLabel.text = planet.diameter
        planetPopulationLabel.text = planet.population
    }
}
