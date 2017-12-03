//
//  UITableViewController.swift
//  407tutorial1
//
//  Created by Zhicheng on 2/25/16.
//  Copyright © 2016 Zhicheng. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    var names = [Name]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newName = Name(name: "x", description: "asd")
        names.append(newName)
        
        newName = Name(name: "abc", description: "oooo")
        names.append(newName)
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! TableViewCell
        
        cell.title.text = self.names[indexPath.row].name

        cell.headImage.layer.masksToBounds = false
        cell.headImage.layer.cornerRadius = cell.headImage.frame.size.width/2
        cell.headImage.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("nameSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let descScene = segue.destinationViewController as! NameViewController
        
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedName = names[indexPath.row]
            descScene.currentName = selectedName
            
        }
    }
}