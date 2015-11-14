//
//  BAPWorkOrders.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPWorkOrders: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func workLink(sender: AnyObject) {
        if let url = NSURL(string: "https://portal.bc.edu/portal/page/portal/MyServices/FacilitiesWorkRequests?_piref1188_32347539_1188_32347538_32347538.strutsAction=fss.do&_piref1188_32347539_1188_32347538_32347538.strutsSubAction=default&wotype=CM") {
            UIApplication.sharedApplication().openURL(url)
        }
    }

    @IBAction func techLink(sender: AnyObject) {
        if let url = NSURL(string: "https://portal.bc.edu/portal/page/portal/MyServices/ExternalApp?id=servicecenter") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    @IBAction func residenceLink(sender: AnyObject) {
        if let url = NSURL(string: "http://www.macgray.com/laundrylinx/index.cgi?password=bceagles&Action=Pass") {
            UIApplication.sharedApplication().openURL(url)
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
