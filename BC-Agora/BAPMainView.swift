//
//  BAPMainView.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class BAPMainView: UIViewController {

    @IBOutlet var welcome_message: UILabel!
    @IBOutlet var eagle_bucks: UILabel!
    @IBOutlet var combo: UILabel!
    @IBOutlet var diningImage: UIImageView!
    
    var json_dict = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let json_data = getJSON("https://raw.githubusercontent.com/TeamDeverse/BC-Agora/master/user_example.json")
        
        json_dict = getJSON_dict(json_data)
        welcome_message.text = "Welcome, " + (json_dict["firstname"]! as! String) + "!"
        
        let f0 = json_dict["dining"]!["eaglebucks"] as! Float
        let s0 = NSString(format: "%.2f", f0)
        eagle_bucks.text = "$" + (s0 as String)
        
        ////let f1 = json_dict["mailbox"]!["code"] as! Int
        //let s1 = String(f1)
        combo.text = json_dict["mailbox"]!["code"] as? String
        
        //combo.text! = json_dict["mailbox"]!["code"] as! String
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "main_babst")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.5
        
        UIGraphicsEndImageContext()
        
        self.view.addSubview(imageView)
        //self.view.backgroundColor = UIColor(patternImage: image).colorWithAlphaComponent(0.9)
        
       // view.backgroundColor = UIColor(patternImage: imageView)
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
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
