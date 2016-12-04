//
//  PostEventTableViewController.swift
//  FreeFood
//
//  Created by Xuan Liu on 2016/11/28.
//  Copyright © 2016年 Xuan Liu. All rights reserved.
//

import UIKit
import Firebase

class PostEventTableViewController: UITableViewController {
    
    var ref: FIRDatabaseReference!
    
    //var foodItems = [Food]() // of a particular event added by host
    @IBOutlet weak var eventName: UITextField!
    
    @IBOutlet weak var pickerTextField: UITextField!
    @IBAction func pickDateAction(_ sender: Any) {
        
        
    }
    @IBOutlet weak var endPickerTextField: UITextField!
    
    @IBAction func endPickDateAction(_ sender: Any) {
        
    }
    @IBOutlet weak var eventLocation: UITextField!
    
    @IBOutlet weak var eventZipcode: UITextField!
    
    @IBOutlet weak var eventURL: UITextField!
    
    @IBOutlet weak var eventDescription: UITextField!
    
    @IBAction func submitEvent(_ sender: Any) {
        
        if !eventName.text!.isEmpty {
            
            let data =  [Constants.Event2.eventName: eventName.text! as String]
            storeInDB(data: data)
            eventName.resignFirstResponder()
 
        }
    }
    
    func storeInDB(data: [String: String]) {
        var copyData = data
        
        if !eventLocation.text!.isEmpty {
            copyData[Constants.Event2.eventLocation] = eventLocation.text! as String
        } else {
            let alertController = UIAlertController(title: "Required Section", message: "Location is a required field", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        
        if !eventZipcode.text!.isEmpty {
            copyData[Constants.Event2.evventZipCode] = eventZipcode.text! as String
        } /*else {
            // create an alert - > Reqd field
            let alertController = UIAlertController(title: "Required Section", message: "Zipcode is a required field", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }*/
        
        if !eventDescription.text!.isEmpty {
            copyData[Constants.Event2.eventDescription] = eventDescription.text! as String
        }
        
        if !eventURL.text!.isEmpty {
            copyData[Constants.Event2.eventUrl] = eventURL.text! as String
        }

        ref.child("Events").childByAutoId().setValue(copyData)
    }
    
    let foodItems = ["food1","food2","food3","food4","food5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create a reuseable cell for each food item displayed in the food list
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "foodItemCell")
        
        //remove additional unecessary cells
        self.tableView.tableFooterView = UIView(frame:CGRect.zero)
        //set up text color
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .textColor = UIColor.gray
        UILabel.appearance(whenContainedInInstancesOf: [UITableViewHeaderFooterView.self])
            .font = UIFont.systemFont(ofSize: 13.0, weight: UIFontWeightMedium)
        //set up date picker for the event time text field
        let pickerView = UIDatePicker()
        pickerTextField.inputView = pickerView
        endPickerTextField.inputView = pickerView
        
        
        // connecting to firebase databse
        ref = FIRDatabase.database().reference()
    }
    
    
    //2 sections in total
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //the 1st section has 6 rows for basic event info and 1 row to edit food items, the 2nd section (with index 1) has 1 row to dynamically populate multiple rows for a list of food items that the user adds
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
        -> Int {
            if section == 1 {
                return foodItems.count
            }else{
                return 8
            }
    }
    
    
    //cell set up
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            
            //only the 2nd section (with index 1) is dynamic
            if indexPath.section == 1 {
                //when it reaches the dynamic section, generate the reusable cell identified by "foodItemCell", which we init it at the beginning of this code file
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodItemCell",for: indexPath)
                //disable cell selection highlight
                cell.selectionStyle = UITableViewCellSelectionStyle.none
                
                //fetch the corresponding name of the food item and populate many rows
                cell.textLabel?.text = foodItems[indexPath.row]
                
                //disable the selected row highlight
                return cell
            }else{ //for the 1st section (the more static one)
//                let cellS = super.tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//                cellS.selectionStyle = .none
                return super.tableView(tableView, cellForRowAt: indexPath)
            }
    }
    
    //set up the dynamic sectoin's row's height
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1{
            return 44
        }else{
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    //data source and delegate, dynamically insert new row when we get new data
    override func tableView(_ tableView: UITableView,
                            indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 1{
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }else{
            return super.tableView(tableView, indentationLevelForRowAt: indexPath)
        }
    }
//disable highlight for each row
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //Change the selected background view of the cell.
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
