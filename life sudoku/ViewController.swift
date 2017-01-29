//
//  ViewController.swift
//  life sudoku
//
//  Created by Julia Kieserman on 1/28/17.
//  Copyright © 2017 Julia Kieserman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        
           pickerData = ["sleep", "work", "exercise"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

