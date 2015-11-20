//
//  BAPMailbox.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPDining: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet var eagleButton: UIButton!
    
    @IBOutlet var tableView: UITableView!
    
    let dining_labels = ["Dining Dollars: $", "Flex Plan: $", "Eagle Bucks: $"]
    let textCellIdentifier = "TextCell"
    
    //let dining_labels = ["Eagle Number: ", "First Name: ", "Last Name: ", "Mailbox Combo: ","Dorm Name: ", "Dorm Room: "]
    
    var json_dict = [:]
    
    var diningArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let json_data = getJSON("https://raw.githubusercontent.com/TeamDeverse/BC-Agora/master/user_example.json")
        
        json_dict = getJSON_dict(json_data)
        
        diningArray = getdiningArray(json_dict)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "alumni_stadium")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.5
        
        UIGraphicsEndImageContext()
        
        self.view.insertSubview(imageView, atIndex: 0)
        
        let cornerRadius : CGFloat = 5.0
        let borderAlpha : CGFloat = 0.7
        eagleButton.frame = CGRectMake(100, 100, 200, 40)
        //laundry.setTitle("Login", forState: UIControlState.Normal)
        eagleButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        eagleButton.backgroundColor = UIColor.clearColor()
        eagleButton.layer.borderWidth = 1.0
        eagleButton.layer.borderColor = UIColor(white: 0.0, alpha: borderAlpha).CGColor
        eagleButton.layer.cornerRadius = cornerRadius
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func getJSON_dict(json_data: NSData) -> NSDictionary {
        do {
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(json_data, options: []) as? NSDictionary {
                return jsonResult
                //let k = jsonResult.allKeys
                //print(k)
            }
        } catch {
            print(error)
        }
        return [:]
    }
    
    func getdiningArray(json_dict: NSDictionary) -> [AnyObject]{
        let dining_json = json_dict["dining"]!
        
        let f0 = dining_json["diningbucks"] as! Float
        let s0 = NSString(format: "%.2f", f0)

        let diningString = dining_labels[0] + (s0 as String)
        let diningBold = NSMutableAttributedString(
            string: diningString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        diningBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: dining_labels[0].characters.count,
                length: (s0 as String).characters.count))
        
        let f1 = dining_json["flexplan"] as! Float
        let s1 = NSString(format: "%.2f", f1)
        
        let flexString = dining_labels[1] + (s1 as String)
        let flexBold = NSMutableAttributedString(
            string: flexString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        flexBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: dining_labels[1].characters.count,
                length: (s1 as String).characters.count))
        
        
        let f2 = dining_json["eaglebucks"] as! Float
        let s2 = NSString(format: "%.2f", f2)
        
        let eagleString1 = dining_labels[2] + (s2 as String)
        let eagleBold1 = NSMutableAttributedString(
            string: eagleString1,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        eagleBold1.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: dining_labels[2].characters.count,
                length: (s2 as String).characters.count))
        
        var dining_array =  [AnyObject]()
        
        dining_array.append(diningBold)
        dining_array.append(flexBold)
        dining_array.append(eagleBold1)
        
        return dining_array
    }
    
    // MARK:  UITextFieldDelegate Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dining_labels.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.textLabel?.attributedText = diningArray[row] as! NSAttributedString
        
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        //print(swiftBlogs[row])
    }
    
    @IBAction func pushBucks(sender: AnyObject) {
        if let url = NSURL(string: "https://portal.bc.edu/portal/page/portal/MyServices/OneCardFundsWPS?_piref1188_33766710_1188_33766709_33766709.__ora_navig=eagleID%3DzlG6zWGlGlpnulGn%26proxied%3Dfalse%26displayName%3DWilliam%252BBowditch%26checkNoGood%3Dfalse%26statusFlag%3DSD%26studentEagleBucks%3D17.81%26employeeEagleBucks%3D0.00%26saBal%3D%25252B2429000%26saMaxBal%3D10000%26struts.portlet.action%3D%252Feagleonecard%252Fview%252Fmain%252FpurchaseList!displayInput%26struts.portlet.mode%3Dview%26struts.portlet.eventAction%3Dtrue") {
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
