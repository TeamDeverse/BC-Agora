//
//  BAPStudentInfo.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/20/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPStudentInfo : UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var label: UILabel!
    var data :[AnyObject]!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("innerCell")! as UITableViewCell;
        //cell.textLabel!.text = "\(data[indexPath.row])"
        return cell
    }
}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Item1 = ["Item1","Item1","Item1","Item1"]
    var Item2 = ["Item2","Item2","Item2","Item2"]
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Item1.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! BAPStudentInfo
        
        cell.label.text = Item1[indexPath.row]
        cell.data = Item2;
        
        return cell
    }
}
