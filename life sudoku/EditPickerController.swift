//
//  EditPickerController.swift
//  life sudoku
//
//  Created by Julia Kieserman on 2/4/17.
//  Copyright © 2017 Julia Kieserman. All rights reserved.
//

import UIKit
import Foundation
import SwiftHSVColorPicker

class EditPickerController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet var colorPicker: SwiftHSVColorPicker!

    @IBOutlet weak var pickerTableView: UITableView!
    let cellReuseIdentifier = "cell"
    
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        pickerData = ["sleep", "work", "exercise"]
        //colorPicker.setViewColor(UIColor.red)


        // Do any additional setup after loading the view.
        self.pickerTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        pickerTableView.delegate = self
        pickerTableView.dataSource = self
        
        title = "Activity Types"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pickerData.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.pickerTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.pickerData[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    // this method handles row deletion
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            pickerData.remove(at: indexPath.row)
            
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
            print("is this it?")
        }
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
