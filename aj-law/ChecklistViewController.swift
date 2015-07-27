//
//  ChecklistViewController.swift
//  aj-law
//
//  Created by Simon Orlovsky on 7/23/15.
//  Copyright (c) 2015 simonorlovsky. All rights reserved.
//

import UIKit
import Parse

class ChecklistViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
     var items: [AnyObject] = []
    
    @IBOutlet var titleNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            // Setting the title
            let title = currentUser!.objectForKey("firstName") as! String + "'s Documents"
            titleNavigationItem.title = title
            
            //Loading documents of the current user
            var query = PFQuery(className:"Document")
            query.whereKey("emailAddress", equalTo:currentUser!.email!)
            query.findObjectsInBackgroundWithBlock {
                (objects: [AnyObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    // The find succeeded.
                    println("Successfully retrieved \(objects!.count) scores.")
                    // Do something with the found objects
                    if let objects = objects as? [PFObject] {
                        for object in objects {
                            println(object.objectId)
                        }
                    }
                    self.items = objects!
                    self.tableView.reloadData()
                } else {
                    // Log details of the failure
                    println("Error: \(error!) \(error!.userInfo!)")
                }
            }
        } else {
            // Show the signup or login screen
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println(self.items.count)
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        cell.textLabel?.text = self.items[indexPath.row].objectForKey("name") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("You selected cell #\(indexPath.row)!")
        self.performSegueWithIdentifier("Detail", sender: self)
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
