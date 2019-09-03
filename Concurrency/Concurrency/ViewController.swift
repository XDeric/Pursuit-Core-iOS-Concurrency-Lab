//
//  ViewController.swift
//  Concurrency
//
//  Created by EricM on 9/3/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var state = [Country]()
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let states = state[indexPath.row]
        if let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath) as? CountryTableViewCell{
            cell.nameLabel.text = "Name: \(states.name)"
            cell.capitalLabel.text = "Capital: \(states.capital)"
            cell.populationLabel.text = "Population: \(states.population)"
            
        return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    

}

