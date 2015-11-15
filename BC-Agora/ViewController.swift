//
//  ViewController.swift
//  BC-Agora
//
//  Created by William Bowditch on 11/13/15.
//  Copyright © 2015 William Bowditch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var bcLogo: UIImageView!
    
    @IBOutlet var user: UITextField!
    @IBOutlet var password: UITextField!
    
    @IBOutlet var wrongUser: UILabel!
    @IBOutlet var wrongPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bcLogo.image = UIImage(named: "BostonCollegeEagles.svg")
        print("hello")
        //checkLogin()
        
         navigationController!.navigationBar.barTintColor = UIColor(red: 0.5, green: 0.1, blue: 0.1, alpha: 1)
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String: AnyObject]
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        // Do any additional setup after loading the view, typically from a nib.
        
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gasson")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        if self.user.text == "" {
            wrongUser.text = "Please enter a username."
        }
        
        if self.password.text == "" {
            wrongPassword.text = "Please enter a password."
        }
        if self.user.text != "" && self.password.text != "" {
            print("not empty")
            self.performSegueWithIdentifier("loginSegue", sender: nil)
            
        }
        print("working")
        
    }

}

