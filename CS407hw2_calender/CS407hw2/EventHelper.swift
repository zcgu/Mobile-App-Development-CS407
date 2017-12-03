//
//  EventHelper.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/3/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EvenHelper {
    private class func getAllEvents() -> [Event] {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName: "Events")
        
        //3
        do {
            let results =
            try managedContext.executeFetchRequest(fetchRequest)
            let objectList = results as! [NSManagedObject]
            
            var eventList = [Event]()
            
            for object in objectList {  
                eventList.append(Event(object: object))
            }

            return eventList
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

       return [Event]()
    }
    
    class func getAllEventsForDate(dateComponents : NSDateComponents) -> [Event] {
        let eventList = getAllEvents()
        var resEventList = [Event]()
        
        for event in eventList {
            let calender = NSCalendar.currentCalendar()
            let date1 = event.startDate
            let date2 = event.endDate
            let component1 = calender.components([NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Day], fromDate: date1!)
            let component2 = calender.components([NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Day], fromDate: date2!)
            
            if DateHelper.isSameDay(component1, dayComponents2: dateComponents)
                || DateHelper.isSameDay(component2, dayComponents2: dateComponents) {
                resEventList.append(event)
            }
        }
        
        return resEventList
    }
    
    class func deleteEvent(event : Event) {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        do {
            managedContext.deleteObject(event.object! as NSManagedObject)
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }
    
    class func saveEvent(event : Event) {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity =  NSEntityDescription.entityForName("Events",
            inManagedObjectContext:managedContext)
        
        let eventEntity = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        //3
        eventEntity.setValue(event.information, forKey: "information")
        eventEntity.setValue(event.startDate, forKey: "startDate")
        eventEntity.setValue(event.endDate, forKey: "endDate")
        
        //4
        do {
            try managedContext.save()
            //5
            print("Save done")
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    
}