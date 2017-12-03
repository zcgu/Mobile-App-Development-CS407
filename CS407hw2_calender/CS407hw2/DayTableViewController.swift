//
//  dayTableViewController.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/3/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import UIKit

class DayTableViewController: UITableViewController {
    
    var dayComponents : NSDateComponents?

    var eventList : [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Add button.
        let b = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTapped")
        navigationItem.rightBarButtonItem = b
  
        navigationItem.title = DateHelper.dayMonthName(dayComponents!)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        eventList = EvenHelper.getAllEventsForDate(dayComponents!)
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (eventList?.count)!
    }

    func addTapped() {
        performSegueWithIdentifier("newEventSegue", sender: nil)
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventCell", forIndexPath: indexPath) as! EventTableViewCell
        
        cell.nameLabel.text = eventList![indexPath.row].information
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        cell.timeLabel.text = "Start: " + formatter.stringFromDate(eventList![indexPath.row].startDate!)
            + "   End: " + formatter.stringFromDate(eventList![indexPath.row].endDate!)

        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            EvenHelper.deleteEvent(eventList![indexPath.row])
            
            eventList?.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
