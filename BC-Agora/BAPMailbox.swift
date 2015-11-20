//
//  BAPMailbox.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPMailbox: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var tableView: UITableView!
    
    let mail_labels = ["Eagle Number: ", "First Name: ", "Last Name: ", "Mailbox Combo: ","Dorm Name: ", "Dorm Room: "]
    
    var json_dict = [:]
    
    var mailboxArray = [AnyObject]()
    
    let textCellIdentifier = "TextCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let json_data = getJSON("https://raw.githubusercontent.com/TeamDeverse/BC-Agora/master/user_example.json")
        
        json_dict = getJSON_dict(json_data)
        
        let mailboxArray = getmailboxArray(json_dict)
        //let jsonData: NSData = /* get your json data */
        
        
        //let jsonDict = NSJSONSerialization.JSONObjectWithData(json, options: nil, error: &error) as NSDictionary
        //print(jsonDict)
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
    
    func getmailboxArray(json_dict: NSDictionary) -> [AnyObject]{
        
//        var text: NSString = mail_labels[0] + String(json_dict["eagleID"] as! Int)
//        var attributedText: NSMutableAttributedString = NSMutableAttributedString(string: text as String)
//        
//        attributedText.addAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(14)], range: NSRange(location: 0, length: 5))
        
        //let eagle_id = mail_labels[0]
       // attributedText.addAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(14)]
        
//        var text = "This is my string"
//        var attributedText: NSMutableAttributedString = NSMutableAttributedString(string: text)
//        var attrs = [NSFontAttributeName : UIFont.boldSystemFontOfSize(15)]
        let eagleString = mail_labels[0] + String(json_dict["eagleID"] as! Int)
        let eagleBold = NSMutableAttributedString(
            string: eagleString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        eagleBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: mail_labels[0].characters.count,
                length: String(json_dict["eagleID"] as! Int).characters.count))
        
        //let eagleValue = eagleBold + NSMutableAttributedString(string: String(json_dict["eagleID"] as! Int))
        
        
        let firstString = mail_labels[1] + String(json_dict["firstname"] as! String)
        let firstBold = NSMutableAttributedString(
            string: firstString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        firstBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: mail_labels[1].characters.count,
                length: String(json_dict["firstname"] as! String).characters.count))
        
        let lastString = mail_labels[2] + String(json_dict["lastname"] as! String)
        let lastBold = NSMutableAttributedString(
            string: lastString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        lastBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: mail_labels[2].characters.count,
                length: String(json_dict["lastname"] as! String).characters.count))
        
        let mailboxString = mail_labels[3] + String(json_dict["mailbox"]!["code"] as! String)
        let mailboxBold = NSMutableAttributedString(
            string: mailboxString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        mailboxBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: mail_labels[3].characters.count,
                length: String(json_dict["mailbox"]!["code"] as! String).characters.count))
        
        let dormString = mail_labels[4] + String(json_dict["mailbox"]!["dormname"] as! String)
        let dormBold = NSMutableAttributedString(
            string: dormString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        dormBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: mail_labels[4].characters.count,
                length: String(json_dict["mailbox"]!["dormname"] as! String).characters.count))
        
        let roomString = mail_labels[5] + String(json_dict["mailbox"]!["dormnumber"] as! Int)
        let roomBold = NSMutableAttributedString(
            string: roomString,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia-Bold",
                size: 18.0)!])
        
        roomBold.addAttribute(NSFontAttributeName,
            value: UIFont(
                name: "Georgia",
                size: 18.0)!,
            range: NSRange(
                location: mail_labels[5].characters.count,
                length: String(json_dict["mailbox"]!["dormnumber"] as! Int).characters.count))
        
        
        
        //attributedText.addAttribute(<#T##name: String##String#>, value: <#T##AnyObject#>, range: <#T##NSRange#>)
        //attributedText.addAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(14)], range: NSRange(location: 5, length: 2))
        //attributedText.addAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(14)], range: NSRange(location: 11, length: 6))
        
       // textField.attributedText = attributedText
        //print(attributedText)
        mailboxArray.append(eagleBold)
        mailboxArray.append(firstBold)
        mailboxArray.append(lastBold)
        mailboxArray.append(mailboxBold)
        mailboxArray.append(dormBold)
        mailboxArray.append(roomBold)
//        mailboxArray.append("First Name: " + ( json_dict["firstname"] as! String))
//        mailboxArray.append("Last Name: " + (json_dict["lastname"] as! String))
//        let mail_info = json_dict["mailbox"]!
//        mailboxArray.append("Mailbox Code: " + String((mail_info["code"] as! Int)))
//        mailboxArray.append("Dorm Name: " + (mail_info["dormname"] as! String))
//        mailboxArray.append("Room Number: " + String((mail_info["dormnumber"] as! Int)))
        
       
        return mailboxArray
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
    
    
    
    
    // MARK:  UITextFieldDelegate Methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return swiftBlogs.count
        //print(json_dict.allKeys.count)
        return mailboxArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        
        //let object = json_dict[indexPath.row]
        
        //cell.textLabel?.text =  object!["mailbox"] as? String
        //et mailbox_array = getmailboxArray(json_dict)
        let row = indexPath.row
        //cell.textLabel!.text = mailboxArray[row] as! String
        cell.textLabel?.attributedText = mailboxArray[row] as! NSAttributedString
        
        return cell
    }
    
     // MARK:  UITableViewDelegate Methods
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        //print(swiftBlogs[row])
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
