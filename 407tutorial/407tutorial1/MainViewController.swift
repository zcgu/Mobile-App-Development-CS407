//
//  ViewController.swift
//  407tutorial1
//
//  Created by Zhicheng on 2/24/16.
//  Copyright © 2016 Zhicheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let client = E2GEatgetherClient.defaultClient()
        let request = E2GUserContactRequestModel()
        request.userID = "gu1"
        request.operation = "read"
        
        
        
        
        client.e2gusercontactPost(request).continueWithBlock(didReceive)
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("editing")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didReceive(task : AWSTask) -> AnyObject! {
        if ((task.error) != nil) {
            print("error")
        }
        
        if ((task.result) != nil) {
            let response = task.result as! [E2GUserContactResponseModel]
            
            for item in response {
                print(item.userID.S)
            }
            
        }
        
        return nil
    }

}

