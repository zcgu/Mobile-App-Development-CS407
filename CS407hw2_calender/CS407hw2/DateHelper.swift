//
//  DateHelper.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/3/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import Foundation

class DateHelper {
    
    static let dic = [1:"Jan", 2:"Feb", 3:"Mar", 4:"Apr", 5:"May", 6:"June",
            7:"July", 8:"Aug", 9:"Sept", 10:"Oct", 11:"Nov", 12:"Dec"]
        
    class func monthName(monthComponent : NSDateComponents) -> String {
        return dic[monthComponent.month]! + " " + String(monthComponent.year)
    }
    
    class func dayMonthName(components : NSDateComponents) -> String {
        return dic[components.month]! + " " + String(components.day) + ", " + String(components.year)
    }
    
    class func nextMonth(monthYearComponents : NSDateComponents) -> NSDateComponents{
        let newMonthYearComponents = monthYearComponents.copy() as! NSDateComponents
        
        if monthYearComponents.month == 12 {
            newMonthYearComponents.setValue(1, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(monthYearComponents.year + 1, forComponent: NSCalendarUnit.Year)
        } else {
            newMonthYearComponents.setValue(monthYearComponents.month + 1, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(monthYearComponents.year, forComponent: NSCalendarUnit.Year)
        }
        
        return newMonthYearComponents
    }
    
    
    class func lastMonth(monthYearComponents : NSDateComponents) -> NSDateComponents{
        let newMonthYearComponents = monthYearComponents.copy() as! NSDateComponents
        
        if monthYearComponents.month == 1 {
            newMonthYearComponents.setValue(12, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(monthYearComponents.year - 1, forComponent: NSCalendarUnit.Year)
        } else {
            newMonthYearComponents.setValue(monthYearComponents.month - 1, forComponent: NSCalendarUnit.Month)
            newMonthYearComponents.setValue(monthYearComponents.year, forComponent: NSCalendarUnit.Year)
        }
        
        return newMonthYearComponents
    }
    
    
    
    class func getMonthDates(monthYearComponents : NSDateComponents) -> [NSDateComponents]{
        var firstDayComponents = monthYearComponents.copy() as! NSDateComponents
        firstDayComponents.setValue(1, forComponent: NSCalendarUnit.Day)
        
        let calender = NSCalendar.currentCalendar()
        let date = calender.dateFromComponents(firstDayComponents)!
        
        firstDayComponents = calender.components([NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Day, NSCalendarUnit.Weekday], fromDate: date)
        
        let lastDateInt = lastDayInMonth(firstDayComponents)
        
        var allDatesComponents = [NSDateComponents]()
        for i in 1...lastDateInt {
            let newDayComponents = firstDayComponents.copy() as! NSDateComponents
            newDayComponents.setValue(i, forComponent: NSCalendarUnit.Day)
            newDayComponents.setValue((firstDayComponents.weekday - 1 + i - 1) % 7 + 1, forComponent: NSCalendarUnit.Weekday)
            allDatesComponents.append(newDayComponents)
        }
        
        return allDatesComponents
    }
    
    private class func lastDayInMonth(monthAndYear : NSDateComponents) -> Int {
        let calender = NSCalendar.currentCalendar()

        let nextMonthYearComponents = nextMonth(monthAndYear)
        
        let lastDate = calender.dateFromComponents(nextMonthYearComponents)?.dateByAddingTimeInterval(-1)
        
        let lastDayComponents = calender.components(NSCalendarUnit.Day, fromDate: lastDate!)
        
        return lastDayComponents.day
    }
    
    class func isToday(components : NSDateComponents) -> Bool {
        
        let todayComponents = todayComponent()
        
        if todayComponents.day == components.day && todayComponents.month == components.month && todayComponents.year == components.year {
            return true
        } else {
            return false
        }
    }
    
    class func todayComponent() -> NSDateComponents{
        let calender = NSCalendar.currentCalendar()
        let date = NSDate()
        return calender.components([NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Day, NSCalendarUnit.Weekday], fromDate: date)
    }
    
    class func isSameDay(dayComponents1 : NSDateComponents, dayComponents2 : NSDateComponents) -> Bool {
        if (dayComponents1.day != dayComponents2.day) {
            return false
        } else if (dayComponents1.month != dayComponents2.month) {
            return false
        } else if (dayComponents1.year != dayComponents2.year) {
            return false
        }
        
        return true
    }
}