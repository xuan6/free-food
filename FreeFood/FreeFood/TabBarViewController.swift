//
//  TabBarViewController.swift
//  FreeFood
//
//  Created by Xuan Liu on 2016/12/6.
//  Copyright © 2016年 Xuan Liu. All rights reserved.
//

import UIKit

let userDefault = UserDefaults.standard


class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        var selectedIndex=Int()
//        var freshLaunch = true
//        if freshLaunch == true {
//            freshLaunch = false
//            if defaultData.checktab == false{
//                selectedIndex = 0
//            }else{
//                selectedIndex = defaultData.userscreen-1
//            }
//            if (self.tabBarController != nil){
//                print("tab bar exist")
//            }
//            self.tabBarController?.setValue(selectedIndex, forKey: "selectedIndex")
//            //            self.tabBarController?.selectedIndex = selectedIndex
//            print(self.tabBarController?.value(forKey: "selectedIndex"))
//        }

       

        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
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
