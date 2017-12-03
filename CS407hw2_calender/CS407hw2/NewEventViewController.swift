//
//  NewEventViewController.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/3/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import UIKit
import CoreData

class NewEventViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var startTimePicker: UIDatePicker!
    @IBOutlet weak var endTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "New Event"
        
        let b = UIBarButtonItem(title: "Finish", style: .Plain, target: self, action: "finishTapped")
        navigationItem.rightBarButtonItem = b
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func finishTapped() {
        
        if nameText.text!.isEmpty {
            let alert = UIAlertController(title: "Empty event name", message: "Please write event name!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
            return
        }
        
        let event = Event()
        
        event.information = nameText.text
        event.startDate = startTimePicker.date
        event.endDate = endTimePicker.date
        
        EvenHelper.saveEvent(event)
        
        navigationController?.popViewControllerAnimated(true)
    }


}
