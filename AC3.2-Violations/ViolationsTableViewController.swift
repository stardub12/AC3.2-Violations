//
//  ViolationsTableViewController.swift
//  AC3.2-Violations
//
//  Created by Simone Grant on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViolationsTableViewController: UITableViewController {
    
    var restaurantViolations = [Violations]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        
    }

    
    func loadData() {
        guard let path = Bundle.main.path(forResource: "violations", ofType: "json"),
            let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path), options:  NSData.ReadingOptions.mappedIfSafe),
            let violationsJSON = try? JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as? NSArray else {
                return
        }
        
        if let violations = violationsJSON as? [[String:Any]] {
            for violationDict in violations {
                if let ep = Violations(model: violationDict) {
                    self.restaurantViolations.append(ep)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantViolations.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        
        let currentViolation = restaurantViolations[indexPath.row]
        cell.textLabel?.text = currentViolation.name
        cell.detailTextLabel?.text = currentViolation.street

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let selectedOffense = restaurantViolations[indexPath.row]
        performSegue(withIdentifier: "segueViolations", sender: selectedOffense)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueViolations" {
            let destination = segue.destination as! ViewController
            let newObject = sender as! Violations
            destination.currentViolation = newObject
        }
    }


}
