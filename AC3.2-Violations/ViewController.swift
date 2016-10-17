//
//  ViewController.swift
//  AC3.2-Violations
//
//  Created by Jason Gresh on 10/15/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentViolation: Violations!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cusineLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var actionLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var violationCode: UILabel!
    @IBOutlet weak var violationDescription: UILabel!
    
    /*
 
     func displayDetailScreen() {
     self.navigationItem.title = thisViolatingRestaurant.name
     
     dateScoreLabel.text = "\(thisViolatingRestaurant.date)\n Score: \(thisViolatingRestaurant.score)"
     
     if let imageName = thisViolatingRestaurant.grade {
     gradeImageView.image = UIImage(named: imageName)
     } else {
     gradeImageView.image = UIImage(named: "P")
     }
     
     nameLabel.text = thisViolatingRestaurant.name
     cuisineTypeLabel.text = "Type of Cuisine: \(thisViolatingRestaurant.cuisineDescription)"
     addressLabel.text = "\(thisViolatingRestaurant.addressString)\nPhone: \(thisViolatingRestaurant.phone)"
     actionLabel.text = thisViolatingRestaurant.action
     violationDescriptionLabel.text = "Violation Code: \(thisViolatingRestaurant.violationCode)\n\(thisViolatingRestaurant.violationDescription)"
     }

 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        violationDetails()
    }

    func violationDetails() {
        navigationItem.title = currentViolation.name
        
        scoreLabel.text = "Score: \(currentViolation.score)"
        
                
        cusineLabel.text = "Restaurant Specialty: \(currentViolation.cuisineDescription)"
        
        nameLabel.text = currentViolation.name
        
        addressLabel.text = currentViolation.address
        violationCode.text = currentViolation.violationCode
        violationDescription.text = currentViolation.violationDescription
        }
    }
    



