//
//  Violations.swift
//  AC3.2-Violations
//
//  Created by Simone Grant on 10/17/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Violations {
    
    /*
     "action": "Violations were cited in the following area(s).",
     "boro": "QUEENS",
     "building": "4277",
     "camis": "50038414",
     "critical_flag": "Not Critical",
     "cuisine_description": "Caf\u00c3\u00a9/Coffee/Tea",
     "dba": "ETTO EXPRESSO BAR",
     "grade": "A",
     "grade_date": "2016-01-06T00:00:00.000",
     "inspection_date": "2016-01-06T00:00:00.000",
     "inspection_type": "Cycle Inspection / Initial Inspection",
     "phone": "7187864320",
     "record_date": "2016-10-15T06:04:14.000",
     "score": "10",
     "street": "HUNTER ST",
     "violation_code": "10F",
     "violation_description": "Non-food contact surface improperly constructed. Unacceptable material used. Non-food contact surface or equipment improperly maintained and/or not properly sealed, raised, spaced or movable to allow accessibility for cleaning on all sides, above and underneath the unit.",
     "zipcode": "11101"
 */
    
    let name: String //dba
    let grade: String//grade
    let building: String //building
    let street: String //street
    let boro: String //boro
    let zipCode: String //zipcode
    var address: String {
        get {
            return "\(building), \(street), \(boro) \(zipCode)"
        }
    }
    let cuisineDescription: String //cuisine_description
    let phone: String //phone
    let score: String //score
    let inspectionDate: String //inspection_date
    let inspectionType: String //inspection_type
    let action: String //action
    let violationCode: String //violation_code
    let violationDescription: String //violation_description
    
    init(name: String, grade: String, building: String, street: String, boro: String, zipCode: String, cuisineDescription: String, phone: String, score: String, inspectionDate: String, inspectionType: String, action: String, violationCode: String, violationDescription: String) {
        self.name = name
        self.grade = grade
        self.building = building
        self.street = street
        self.boro = boro
        self.zipCode = zipCode
        self.cuisineDescription = cuisineDescription
        self.phone = phone
        self.score = score
        self.inspectionDate = inspectionDate
        self.inspectionType = inspectionType
        self.action = action
        self.violationCode = violationCode
        self.violationDescription = violationDescription
        
        
    }
    
    convenience init?(model: [String:Any]) {
        if let name = model["dba"] as? String,
        let grade = model["grade"] as? String,
        let building = model["building"] as? String,
        let street = model["street"] as? String,
        let boro = model["boro"] as? String,
        let zipCode = model["zipcode"] as? String,
        let cuisineDescription = model["cuisine_description"] as? String,
        let phone = model["phone"] as? String,
        let score = model["score"] as? String,
        let inspectionDate = model["inspection_date"] as? String,
        let inspectionType = model["inspection_type"] as? String,
        let action = model["action"] as? String,
        let violationCode = model["violation_code"] as? String,
            let violationDescription = model["violation_description"] as? String {
            
            self.init(name: name, grade: grade, building: building, street: street, boro: boro, zipCode: zipCode, cuisineDescription: cuisineDescription, phone: phone, score: score, inspectionDate: inspectionDate, inspectionType: inspectionType, action: action, violationCode: violationCode, violationDescription: violationDescription)
        }
        else {
            return nil
        }
    }
    
}
