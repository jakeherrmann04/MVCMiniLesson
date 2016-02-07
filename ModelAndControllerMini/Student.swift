//
//  Student.swift
//  ModelAndControllerMini
//
//  Created by Jake Herrmann on 2/4/16.
//  Copyright © 2016 Jake Herrmann. All rights reserved.
//

import Foundation

class Student {
    
    private let firstNameKey = "firstNameKey"
    private let lastNameKey = "lastNameKey"
    private let ageKey = "ageKey"
    
    var firstName : String
    var lastName : String
    var age : String
    
    init(firstName : String, lastName : String, age : String){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        
    }
    
    init?(dictionary : Dictionary<String, AnyObject>){
        guard let firstName = dictionary[firstNameKey] as? String,
            let lastName = dictionary[lastNameKey] as? String,
            let age = dictionary[ageKey] as? String else{
                
                self.firstName = ""
                self.lastName = ""
                self.age = ""
                return nil
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func dictionaryCopy() -> Dictionary<String, AnyObject>{

        let dictionary = [
            firstNameKey : self.firstName,
            lastNameKey : self.lastName,
            ageKey : self.age
            ]

        return dictionary
    }
    
    
}