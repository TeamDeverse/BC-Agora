//
//  AGOloginVC.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/1/15.
//  Copyright © 2015 Deverse. All rights reserved.
//

import UIKit

class AGOloginVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func mainPageSegue(sender: AnyObject) {
        performSegueWithIdentifier("segueToMainPage", sender: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
