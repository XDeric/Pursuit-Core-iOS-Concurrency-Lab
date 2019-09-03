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
        let cell = tableViewOutlet.dequeueReusableCell(withIdentifier: "ourCell", for: indexPath)
            cell.textLabel?.text = "Name: \(states.name)"
            cell.detailTextLabel?.text = "Capital: \(states.capital) Population: \(states.population)"
            return cell
    }
    
    private func loadData() {
        //pathToJSONFile is just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "united", ofType: "json") else {
            fatalError("Could not find bundle")
        }
        print(pathToJSONFile)
        //url is the reference of the location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let resultsFromJSON = Country.getCountry(from: data)
            state = resultsFromJSON
        } catch {
            fatalError("Could not decode")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier != nil else { fatalError("No identifier in segue")
        }
        guard let countryVC = segue.destination as? DetailViewController
            else { fatalError("Unexpected segue")}
        guard let selectedIndexPath = tableViewOutlet.indexPathForSelectedRow
            else { fatalError("No row selected") }
        countryVC.countries = state[selectedIndexPath.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
}

