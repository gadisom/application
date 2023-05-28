import UIKit
import SimpleAlert
class CalculatorVC: UIViewController {

    @IBOutlet weak var resultNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var firstNum: UITextField!
    var selectButton : UIButton?
    func setSelectedButton(_ sender : UIButton)
    {
        selectButton?.isSelected = false
        selectButton = sender
        selectButton?.isSelected = true
    }
    @IBAction func uiRemainderButton(_ sender: Any) {
        setSelectedButton(sender as! UIButton)
    }
    @IBAction func uiDivideButton(_ sender: Any) {
        setSelectedButton(sender as! UIButton)
    }
    @IBAction func didMulti(_ sender: Any) {
        setSelectedButton(sender as! UIButton)
    }
    @IBAction func didSub(_ sender: Any) {
        setSelectedButton(sender as! UIButton)
    }
    @IBAction func didAdd(_ sender: Any) {
        setSelectedButton(sender as! UIButton)
        
    }
    @IBAction func uiACButton(_ sender: Any ) {
        self.firstNum.text = ""
        self.secondNum.text = ""
        resultNum.text = ""
    }
    
   
    @IBAction func resultButton(_ sender: Any) {
        let firstData = Double(firstNum.text ?? "") ?? 0.0
        let secondData = Double(secondNum.text ?? "") ?? 0.0
        var resultData : Double = 0.0
        switch selectButton?.tag {
        case 0:
            resultData = firstData + secondData
        case 1:
            resultData = firstData - secondData
        case 2:
            resultData = firstData * secondData
        case 3:
            resultData = firstData / secondData
        case 4:
            resultData = firstData.truncatingRemainder(dividingBy: secondData)
        default :
            break
        }
        resultNum.text = String(resultData)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    

    
    

}
