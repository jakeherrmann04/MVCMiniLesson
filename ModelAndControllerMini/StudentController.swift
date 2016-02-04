//
//  StudentController.swift
//  ModelAndControllerMini
//
//  Created by Jake Herrmann on 2/4/16.
//  Copyright © 2016 Jake Herrmann. All rights reserved.
//

import Foundation

class StudentController {
    
    static let sharedInstance = StudentController()
    
    var studentArray : [Student]
    
    init(){
        studentArray = []
    }
    
    func addStudent(student : Student){
        
        studentArray.append(student)
    }
    
    func removeStudent(indexPath : NSIndexPath){
        
        studentArray.removeAtIndex(indexPath.row)
        
    }
    
    
    
}