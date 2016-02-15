//
//  Student.swift
//  ModelAndControllerMini
//
//  Created by Jake Herrmann on 2/4/16.
//  Copyright © 2016 Jake Herrmann. All rights reserved.
//

import Foundation

class Student : NSObject, NSCoding {
    
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
   @objc required init?(coder aDecoder: NSCoder) {
        guard let firstName = aDecoder.decodeObjectForKey(firstNameKey) as? String else{
            
            self.firstName = ""
            self.lastName = ""
            self.age = ""
            super.init()
            return nil
        }
    
        self.firstName = firstName
        self.lastName = aDecoder.decodeObjectForKey(lastNameKey) as! String
        self.age = aDecoder.decodeObjectForKey(ageKey) as! String
        super.init()
    }
    
    @objc func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.firstName, forKey: firstNameKey)
        aCoder.encodeObject(self.lastName, forKey: lastNameKey)
        aCoder.encodeObject(self.age, forKey: ageKey)
        
    }
    
    
    /*
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
    */
    
}