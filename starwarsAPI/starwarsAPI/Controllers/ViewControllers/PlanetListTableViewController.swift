//
//  PlanetListTableViewController.swift
//  starwarsAPI
//
//  Created by Mathias on 6/17/20.
//  Copyright © 2020 Mathias Chevez. All rights reserved.
//

import UIKit

class PlanetListTableViewController: UITableViewController {
    
    var planets: [Planet] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPlanets()
    }
    
    func fetchPlanets() {
        PlanetController.fetchPlanets { (result) in
            switch result {
            case .success(let planets):
                self.planets = planets
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return planets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "planetCell", for: indexPath) as? PlanetTableViewCell else { return UITableViewCell()}
        let planet = planets[indexPath.row]
        cell.planet = planet

        return cell
    }
}
