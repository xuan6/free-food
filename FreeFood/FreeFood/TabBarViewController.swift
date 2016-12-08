//
//  TabBarViewController.swift
//  FreeFood
//
//  Created by Xuan Liu on 2016/12/6.
//  Copyright © 2016年 Xuan Liu. All rights reserved.
//

import UIKit

let userDefault = UserDefaults.standard
var intValue = userDefault.integer(forKey: "initial")
//var userZip = userDefault.string(forKey: "zipcode")

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.selectedIndex = intValue
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
