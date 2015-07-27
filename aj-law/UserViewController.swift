//
//  UserViewController.swift
//  aj-law
//
//  Created by Simon Orlovsky on 7/24/15.
//  Copyright (c) 2015 simonorlovsky. All rights reserved.
//

import UIKit
import Parse

class UserViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Do stuff with the user
            let title = (currentUser!.objectForKey("firstName") as! String) + " " + (currentUser!.objectForKey("lastName") as! String)
            nameLabel.text = title
        } else {
            // Show the signup or login screen
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutButtonPressed(sender: AnyObject) {
        PFUser.logOut()
        var currentUser = PFUser.currentUser()
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
