import UIKit

class MainViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var calendarView: UITableView!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    var timeArray: [String] = [String]()
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var editPickerData: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        
        pickerData = ["sleep", "work", "exercise"]
        
        timeArray = ["12am", "1am", "2am", "3am", "4am", "5am", "6am", "7am", "8am",
        "9am", "10am", "11am", "12pm", "1pm", "2pm", "3pm", "4pm", "5pm", "6pm", "7pm",
        "8pm", "9pm", "10pm", "11pm"]
        
        self.calendarView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        calendarView.delegate = self
        calendarView.dataSource = self

        
    }
    
   @IBAction func editPickerDataShow(_ sender: AnyObject) {
    
        self.performSegue(withIdentifier: "showEditPicker", sender:self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* functions for picker view */
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    /* end of functions for picker view */
    
    /* functions for table view */
    // number of rows in table view
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.timeArray.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.calendarView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.timeArray[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
    /* end of functions for table view */
    
    
}
