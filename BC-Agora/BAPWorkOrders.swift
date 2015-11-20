//
//  BAPWorkOrders.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPWorkOrders: UIViewController {

    @IBOutlet var workOrder: UIButton!
    @IBOutlet var techHelp: UIButton!
    @IBOutlet var laundry: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cornerRadius : CGFloat = 5.0
        let borderAlpha : CGFloat = 0.7
        
        workOrder.frame = CGRectMake(100, 100, 200, 40)
        //workOrder.setTitle("Login", forState: UIControlState.Normal)
        workOrder.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        workOrder.backgroundColor = UIColor.clearColor()
        workOrder.layer.borderWidth = 1.0
        workOrder.layer.borderColor = UIColor(white: 0.0, alpha: borderAlpha).CGColor
        workOrder.layer.cornerRadius = cornerRadius
        
        techHelp.frame = CGRectMake(100, 100, 200, 40)
        //techHelp.setTitle("Login", forState: UIControlState.Normal)
        techHelp.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        techHelp.backgroundColor = UIColor.clearColor()
        techHelp.layer.borderWidth = 1.0
        techHelp.layer.borderColor = UIColor(white: 0.0, alpha: borderAlpha).CGColor
        techHelp.layer.cornerRadius = cornerRadius
        
        laundry.frame = CGRectMake(100, 100, 200, 40)
        //laundry.setTitle("Login", forState: UIControlState.Normal)
        laundry.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        laundry.backgroundColor = UIColor.clearColor()
        laundry.layer.borderWidth = 1.0
        laundry.layer.borderColor = UIColor(white: 0.0, alpha: borderAlpha).CGColor
        laundry.layer.cornerRadius = cornerRadius
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "gasson_statue")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.5
        
        UIGraphicsEndImageContext()
        
        self.view.addSubview(imageView)

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
