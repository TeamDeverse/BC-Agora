//
//  BAPStudentInformation.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/20/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPStudentInformation: UIViewController {
    
    var json_dict = [:]
    var sectionTitleArray : NSMutableArray = NSMutableArray()
    var sectionContentDict : NSMutableDictionary = NSMutableDictionary()
    var arrayForBool : NSMutableArray = NSMutableArray()
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var gpaLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.clearColor()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "snow")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.5
        
        UIGraphicsEndImageContext()
        
        self.view.insertSubview(imageView, atIndex: 0)
        
        
        arrayForBool = ["0","0","0","0","0"] //added
        let json_data = getJSON("https://raw.githubusercontent.com/TeamDeverse/BC-Agora/master/user_example.json")
        
        json_dict = getJSON_dict(json_data)
        let json_info = json_dict["studentinfo"]
        let json_classes = json_info!["classes"]
        
        let f1 = json_info!["gpa"] as! Float
        let s1 = NSString(format: "%.2f", f1)
        
        gpaLabel.text = gpaLabel.text! + (s1 as String)
        let location = "Location: "
        let professor = "Professor: "
        let time = "Time: "
        nameLabel.text = (json_dict["firstname"]! as! String) + " " + (json_dict["lastname"]! as! String)
        tableView.backgroundColor = self.view.backgroundColor
        
        
        sectionTitleArray = [json_classes!![0]!["classname"]!!,json_classes!![1]!["classname"]!!,json_classes!![2]!["classname"]!!,json_classes!![3]!["classname"]!!,json_classes!![4]!["classname"]!!]
        
        let tmp1 : Array = [location + (json_classes!![0]!["location"]!! as! String),professor + (json_classes!![0]!["professor"]!! as! String),time + (json_classes!![0]!["time"]!! as! String)]
        var string1 = sectionTitleArray .objectAtIndex(0) as? String
        [sectionContentDict .setValue(tmp1, forKey:string1! )]
        
        let tmp2 : Array = [location + (json_classes!![1]!["location"]!! as! String),professor + (json_classes!![1]!["professor"]!! as! String),time + (json_classes!![1]!["time"]!! as! String)]
        string1 = sectionTitleArray .objectAtIndex(1) as? String
        [sectionContentDict .setValue(tmp2, forKey:string1! )]
        
        let tmp3 : Array = [location + (json_classes!![2]!["location"]!! as! String),professor + (json_classes!![2]!["professor"]!! as! String),time + (json_classes!![2]!["time"]!! as! String)]
        string1 = sectionTitleArray .objectAtIndex(2) as? String
        [sectionContentDict .setValue(tmp3, forKey:string1! )]
        
        let tmp4 : Array = [location + (json_classes!![3]!["location"]!! as! String),professor + (json_classes!![3]!["professor"]!! as! String),time + (json_classes!![3]!["time"]!! as! String)]
        string1 = sectionTitleArray .objectAtIndex(3) as? String
        [sectionContentDict .setValue(tmp4, forKey:string1! )]
        
        let tmp5 : Array = [location + (json_classes!![4]!["location"]!! as! String),professor + (json_classes!![4]!["professor"]!! as! String),time + (json_classes!![4]!["time"]!! as! String)]
        string1 = sectionTitleArray .objectAtIndex(4) as? String
        [sectionContentDict .setValue(tmp5, forKey:string1! )]
        
        
        
        print(tmp1)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.backgroundColor = UIColor.clearColor()
        
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
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if(arrayForBool .objectAtIndex(section).boolValue == true)
        {
            let tps = sectionTitleArray.objectAtIndex(section) as! String
            let count1 = (sectionContentDict.valueForKey(tps)) as! NSArray
            return count1.count
        }
        return 0;
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "ABC"
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(arrayForBool .objectAtIndex(indexPath.section).boolValue == true){
            return 100
        }
        
        return 2;
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
        headerView.backgroundColor = UIColor.grayColor()
        headerView.tag = section
        
        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
        headerString.text = sectionTitleArray.objectAtIndex(section) as? String
        headerView .addSubview(headerString)
        
        let headerTapped = UITapGestureRecognizer (target: self, action:"sectionHeaderTapped:")
        headerView .addGestureRecognizer(headerTapped)
        
        return headerView
    }
    
    func sectionHeaderTapped(recognizer: UITapGestureRecognizer) {
        print("Tapping working")
        print(recognizer.view?.tag)
        
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection:(recognizer.view?.tag as Int!)!)
        if (indexPath.row == 0) {
            
            var collapsed = arrayForBool .objectAtIndex(indexPath.section).boolValue
            collapsed       = !collapsed;
            
            arrayForBool .replaceObjectAtIndex(indexPath.section, withObject: collapsed)
            //reload specific section animated
            let range = NSMakeRange(indexPath.section, 1)
            let sectionToReload = NSIndexSet(indexesInRange: range)
            self.tableView .reloadSections(sectionToReload, withRowAnimation:UITableViewRowAnimation.Fade)
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let CellIdentifier = "Cell"
        var cell :UITableViewCell
        cell = self.tableView.dequeueReusableCellWithIdentifier(CellIdentifier)! //as! UITableViewCell
        
        let manyCells : Bool = arrayForBool .objectAtIndex(indexPath.section).boolValue
        
        if (!manyCells) {
            //  cell.textLabel.text = @"click to enlarge";
        }
        else{
            let content = sectionContentDict .valueForKey(sectionTitleArray.objectAtIndex(indexPath.section) as! String) as! NSArray
            cell.textLabel?.text = content .objectAtIndex(indexPath.row) as? String
            cell.backgroundColor = UIColor.clearColor()
        }
        
        return cell
    }
    
    
}
