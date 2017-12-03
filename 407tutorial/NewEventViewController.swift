//
//  NewEventViewController.swift
//  407tutorial1
//
//  Created by Zhicheng on 2/26/16.
//  Copyright © 2016 Zhicheng. All rights reserved.
//

import UIKit
import CoreData

class NewEventViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton(sender: AnyObject) {
        print("save button pressed")
    }
}
