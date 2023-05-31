import UIKit
import SimpleAlert
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon

class SetLoginVC: UIViewController {

    @IBAction func onKakaoLoginByAppTouched(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    // 예외 처리 (로그인 취소 등)
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                   // do something
                    _ = oauthToken
                   // 어세스토큰
                   let accessToken = oauthToken?.accessToken
                }
            }
          }
    }
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
           let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TabVC") as! TabVC
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
