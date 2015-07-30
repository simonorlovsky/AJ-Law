//
//  DetailChecklistViewController.swift
//  aj-law
//
//  Created by Simon Orlovsky on 7/24/15.
//  Copyright (c) 2015 simonorlovsky. All rights reserved.
//

import UIKit
import Parse

class DetailChecklistViewController: UIViewController {
    
    var document = PFObject(className: "Document")

    @IBOutlet var documentLocationLabel: UILabel!
    @IBOutlet var documentNameNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(self.document.objectId)
        documentNameNavigationItem.title = document.objectForKey("name") as? String
        documentLocationLabel.text = document.objectForKey("location") as? String
        println(document.objectForKey("name") as? String
)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
