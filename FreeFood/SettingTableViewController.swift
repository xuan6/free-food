//
//  SettingTableViewController.swift
//  FreeFood
//
//  Created by Xuan Liu on 2016/11/29.
//  Copyright © 2016年 Xuan Liu. All rights reserved.
//

import UIKit

class defaultData {
    static var userscreen:Int = 0 //default screen = food
    static var userzip:String = "98105" //default zip = 98105

}

class SettingTableViewController: UITableViewController {
    //set default displayed strings
    var zipDisplay = "98105"
    var screenDisplay = "Food"
    
    @IBOutlet weak var inititalScreen: UILabel!
   
    @IBOutlet weak var userZipcode: UILabel!
    
    //refresh data before this view is visible
    override func viewWillAppear(_ animated: Bool) {
        zipDisplay = defaultData.userzip
        switch(defaultData.userscreen){
        case 0:
            screenDisplay = "Food"
        case 1:
            screenDisplay = "Event"
        default:
            screenDisplay = "Food"
        }
        self.tableView.reloadData()
        print(screenDisplay)
        print(zipDisplay)


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //display user zipcode
        userZipcode.text = zipDisplay
        inititalScreen.text = screenDisplay
        
        
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    //    disable highlight for each row
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Change the selected background view of the cell.
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
