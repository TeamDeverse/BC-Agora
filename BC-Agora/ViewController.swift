//
//  ViewController.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    @IBOutlet var bcLogo: UIImageView!
    
    @IBOutlet var user: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var wrongUser: UILabel!
    @IBOutlet var wrongPassword: UILabel!
    
    var json_dict = [:]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bcLogo.image = UIImage(named: "BostonCollegeEagles.svg")
        print("hello")
        let json_data = getJSON("https://raw.githubusercontent.com/TeamDeverse/BC-Agora/master/user_example.json")
        
        json_dict = getJSON_dict(json_data)
        
        //checkLogin()
         //self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Georgia", size: 20)! ]
        
         navigationController!.navigationBar.barTintColor = UIColor(red: 0.5, green: 0.1, blue: 0.1, alpha: 1)
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Georgia-Bold", size: 20)!]
        
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String: AnyObject]
        
        //self.navigationController!.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Georgia", size: 20)!]
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        //avigationController?.navigationBar.titleTextAttributes = titleDict as? [String: AnyObject]
        
        let cornerRadius : CGFloat = 5.0
        let borderAlpha : CGFloat = 0.7
        
        user.layer.borderWidth = 1.0
        user.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        user.layer.cornerRadius = cornerRadius
        user.backgroundColor = UIColor.clearColor()
        
        password.layer.borderWidth = 1.0
        password.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        password.layer.cornerRadius = cornerRadius
        password.backgroundColor = UIColor.clearColor()
        
        // Do any additional setup after loading the view, typically from a nib.
        
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gasson")!)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "gasson")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageView = UIImageView(image: image)
        imageView.alpha = 0.9
        UIGraphicsEndImageContext()
        
        self.view.insertSubview(imageView, atIndex: 0)
        
        //self.view.addSubview(imageView)
        
        
        button.frame = CGRectMake(100, 100, 200, 40)
        button.setTitle("Login", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.backgroundColor = UIColor.clearColor()
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).CGColor
        button.layer.cornerRadius = cornerRadius
        
        
        
        //self.view.backgroundColor = UIColor(patternImage: image) //.colorWithAlphaComponent(0.7)//
        
        
        
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

    @IBAction func pressLogin(sender: AnyObject) {
        self.wrongPassword.text?.removeAll()
        self.wrongUser.text?.removeAll()
        checkLogin()
        
    }
    func loadUserDefault() {
        //NSUser Default
        //PS file
        //run code before checkLogin code
    }
    func checkLogin(){
        let user_data = json_dict["username"] as! String
        let pass_data = json_dict["password"]as! String
        print(user_data)
        print(pass_data)
        if self.user.text == "" {
            wrongUser.text = "Please enter a username."
        }
        
        if self.password.text == "" {
            wrongPassword.text = "Please enter a password."
        }
        if self.password.text != pass_data {
            wrongPassword.text = "Incorrect password"
        }
        if self.user.text! == user_data && self.password.text! == pass_data {
            print("correct")
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            
        }
        else{
            print(self.password.text)
            //print(pass_data)
        }
        
        print("working")
        
    }
    
    
    
    
    
    
    

}

