import UIKit
import SimpleAlert
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon
import NaverThirdPartyLogin
class SetLoginVC: UIViewController {
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    
    @IBAction func naverLogin(_ sender: Any) {
        loginInstance?.delegate = self
        loginInstance?.requestThirdPartyLogin()
    }
    private func getNaverInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
    }
    
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
                    self.goHomeVC()
                }
            }
          }
        else {UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")
                self.goHomeVC()
                //do something
                _ = oauthToken
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
            goHomeVC()
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
    func goHomeVC()
    {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "TabVC") as! TabVC
        self.present(homeVC,animated: true,completion: nil)
    }
}
extension SetLoginVC: NaverThirdPartyLoginConnectionDelegate {
  // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
  func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
//     let naverSignInVC = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)!
//     naverSignInVC.parentOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.orientation.rawValue)!
//     present(naverSignInVC, animated: false, completion: nil)
  }
  
  // 로그인에 성공했을 경우 호출
  func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
    print("[Success] : Success Naver Login")
      
    getNaverInfo()
    
  }
  
  // 접근 토큰 갱신
  func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
    
  }
  
  // 로그아웃 할 경우 호출(토큰 삭제)
  func oauth20ConnectionDidFinishDeleteToken() {
    loginInstance?.requestDeleteToken()
  }
  
  // 모든 Error
  func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
    print("[Error] :", error.localizedDescription)
  }
}
//kServiceAppUrlScheme
