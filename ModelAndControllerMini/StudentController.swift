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
        
       let unarchivedStudents = NSKeyedUnarchiver.unarchiveObjectWithFile(self.filePath(studentsKey))
    
        if let students = unarchivedStudents as? [Student]{
            self.studentArray = students
        }
    }
    
    func saveToPersistentStorage(){
       
        NSKeyedArchiver.archiveRootObject(self.studentArray, toFile: self.filePath(studentsKey))
        
    }
    
    func addStudent(student : Student){
        
        studentArray.append(student)
        self.saveToPersistentStorage()
    }
    
    func removeStudent(indexPath : NSIndexPath){
        
        studentArray.removeAtIndex(indexPath.row)
        
    }
    
    func filePath(key : String) -> String{
        
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
        
        let documentPath: AnyObject = directorySearchResults[0]
        
        let studentsPath = documentPath.stringByAppendingString("/\(key).plist")

        return studentsPath
   
    }
    
    
    
    
}