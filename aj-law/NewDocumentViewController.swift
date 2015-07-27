//
//  NewDocumentViewController.swift
//  aj-law
//
//  Created by Simon Orlovsky on 7/27/15.
//  Copyright (c) 2015 simonorlovsky. All rights reserved.
//

import UIKit
import Parse

class NewDocumentViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completeButtonPressed(sender: AnyObject) {
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
            var document = PFObject(className:"Document")
            document["name"] = nameTextField.text
            document["location"] = locationTextField.text
            document["user"] = currentUser
            document["emailAddress"] = currentUser?.email

            document.save()
            
            self.performSegueWithIdentifier("Return", sender: self)
            
        } else {
            // Show the signup or login screen
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
