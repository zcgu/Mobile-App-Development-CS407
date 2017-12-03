//
//  MonthViewController.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/2/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import UIKit
import Foundation


class MonthViewController: UIViewController {

    var monthComponents : NSDateComponents?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        let allDayComponents = DateHelper.getMonthDates(monthComponents!)
        
        for i in 1...allDayComponents.count {
            let myView = view.viewWithTag(i + allDayComponents[0].weekday - 1)!
            let tapRec = MyTapGestureRecognizer()
            tapRec.dayComponents = allDayComponents[i-1]
            tapRec.addTarget(self, action: "segue:")
            myView.addGestureRecognizer(tapRec)
            myView.userInteractionEnabled = true
        }
        
        for i in 1...42 {
            let label = view.viewWithTag(i + 100) as! UILabel
            label.text = nil
            label.numberOfLines = 0
        }
        
        for i in 1...allDayComponents.count {
            let label = view.viewWithTag(i + 100 + allDayComponents[0].weekday - 1) as! UILabel
            
            let eventNum = EvenHelper.getAllEventsForDate(allDayComponents[i-1]).count
            var boldText : String
            if eventNum == 0 {
                boldText = "\n"
            } else {
                boldText  = "\n\(eventNum) events"
            }
            
            //Defining fonts of size and type
            let firstfont:UIFont = UIFont(name: (label.font?.fontName)!, size: 17)!
            let boldFont:UIFont = UIFont(name: (label.font?.fontName)!, size: 11)!
            
            let firstDict:NSDictionary = NSDictionary(object: firstfont, forKey:
                NSFontAttributeName)
            let boldDict:NSDictionary = NSDictionary(object: boldFont, forKey:
                NSFontAttributeName)
            
            let firstText = String(allDayComponents[i-1].day)
            let attributedString = NSMutableAttributedString(string: firstText,
                attributes: firstDict as? [String : AnyObject])
            let boldString = NSMutableAttributedString(string:boldText,
                attributes:boldDict as? [String : AnyObject])
            
            attributedString.appendAttributedString(boldString)
            label.attributedText = attributedString
            
            
            if DateHelper.isToday(allDayComponents[i-1]) {
                label.backgroundColor = UIColor.redColor()
            } else {
                label.backgroundColor = nil
            }
        }
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segue(sender : MyTapGestureRecognizer) {
        performSegueWithIdentifier("daySegue", sender: sender.dayComponents)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dayView = segue.destinationViewController as! DayTableViewController

        dayView.dayComponents = sender as? NSDateComponents
    }
    

}
