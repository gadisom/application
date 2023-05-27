import UIKit
import SimpleAlert

class SetLoginVC: UIViewController {

    func setTextField ()
    {
        self.emailText.text = ""
        self.passwordText.text = ""
        self.emailText.placeholder = "email"
        self.passwordText.placeholder = "password"
       
    }
    @IBAction func signButton(_ sender: Any) {
       
        UserDefaults.standard.set(self.emailText.text, forKey: "ID")
        UserDefaults.standard.set(self.passwordText.text, forKey: "PW")
        setTextField()
    }
    
    @IBAction func loginButton(_ sender: Any) {
        
        let userID = UserDefaults.standard.object(forKey: "ID")
        let userPW = UserDefaults.standard.object(forKey: "PW")
      
        if (self.emailText.text == userID as? String) && (self.passwordText.text == userPW as? String)
        {
           let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.present(homeVC,animated: true,completion: nil)
        }
        else {
            setTextField()
            let alert = AlertController(title: "알림", message: "가입 정보를 확인하세요 ", style: .alert)
            alert.addAction(AlertAction(title: "Cancel", style: .cancel))
            present(alert, animated: true, completion: nil)
            
            
        }
    
    }
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

}
