//
//  StudentController.swift
//  ModelAndControllerMini
//
//  Created by Jake Herrmann on 2/4/16.
//  Copyright © 2016 Jake Herrmann. All rights reserved.
//

import Foundation

class StudentController {
    
    private let studentsKey = "students"
    
    static let sharedInstance = StudentController()
    
    var studentArray : [Student]
    
    init(){
        
        studentArray = []
        self.loadFromPresistentStore()
    }
    
    func loadFromPresistentStore(){
        
        let studentDictionariesFromDefaults = NSUserDefaults.standardUserDefaults().objectForKey(studentsKey) as?[Dictionary
        <String, AnyObject>]
        
        if let studentDictionary = studentDictionariesFromDefaults{
            
            self.studentArray = studentDictionary.map({Student(dictionary: $0)!})
        }
    }
    
    func saveToPersistentStorage(){
        let studentDictionaries = self.studentArray.map({$0.dictionaryCopy()})
        NSUserDefaults.standardUserDefaults().setObject(studentDictionaries, forKey: studentsKey)
    }
    
    func addStudent(student : Student){
        
        studentArray.append(student)
        self.saveToPersistentStorage()
    }
    
    func removeStudent(indexPath : NSIndexPath){
        
        studentArray.removeAtIndex(indexPath.row)
        
    }
    
    
    
}