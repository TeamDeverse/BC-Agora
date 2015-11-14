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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bcLogo.image = UIImage(named: "BostonCollegeEagles.svg")
        print("hello")
        
         navigationController!.navigationBar.barTintColor = UIColor(red: 0.5, green: 0.1, blue: 0.1, alpha: 1)
        
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController!.navigationBar.titleTextAttributes = titleDict as? [String: AnyObject]
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

