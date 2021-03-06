/////  AGOmainVC.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/1/15.
//  Copyright © 2015 Deverse. All rights reserved.
//

import UIKit

class AGOmainVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test1")
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func mailboxSegue(sender: AnyObject) {
        performSegueWithIdentifier("segueToMailbox", sender: nil)
    }
    
    @IBAction func workOrdersSegue(sender: AnyObject) {
        performSegueWithIdentifier("segueToWorkOrders", sender: nil)
    }
    
    @IBAction func logout(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBAction func accountBalanceSegue(sender: AnyObject) {
        performSegueWithIdentifier("segueToAccountBalance", sender: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}
