import UIKit

class MainViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var editPickerData: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.categoryPicker.dataSource = self
        self.categoryPicker.delegate = self
        
        pickerData = ["sleep", "work", "exercise"]
        
    }
    
   @IBAction func editPickerDataShow(_ sender: AnyObject) {
    
        self.performSegue(withIdentifier: "showEditPicker", sender:self)

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
