//
//  Event.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/3/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import Foundation
import CoreData

class Event {
    var startDate : NSDate?
    var endDate : NSDate?
    var information : String?
    var location : String?
    var latitude : String?
    var longtitude : String?
    
    var object : NSManagedObject?
    
    init() {
        
    }
    
    init(object : NSManagedObject) {
        self.information = object.valueForKey("information") as? String
        self.startDate = object.valueForKey("startDate") as? NSDate
        self.endDate = object.valueForKey("endDate") as? NSDate
        
        self.object = object
    }
}