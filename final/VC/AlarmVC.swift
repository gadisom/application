import UIKit

class AlarmVC: UIViewController {

    @IBOutlet weak var SettingTime: UILabel!
    @IBOutlet weak var DateTime: UILabel!
    @IBAction func DatePicker(_ sender: Any) {
        
        let formatter = DateFormatter() // 특정 포맷으로 날짜를 보여주기 위한 변수 선언
        formatter.dateFormat = "HH:mm" // 날짜 포맷 지정
        SettingTime.text = formatter.string(from: (sender as AnyObject).date)
    }
    var timer : DispatchSourceTimer?
    var isClickConfirm = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startTimer()
    }
    

    
}
extension AlarmVC {
    func startTimer() {
        let queue = DispatchQueue.global()
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer?.schedule(deadline: .now(), repeating: .seconds(1))
        timer?.setEventHandler { [weak self] in
            DispatchQueue.main.async {
                self?.updatetime()
            }
        }
        timer?.resume()
    }
    func updatetime() {

        let formatter = DateFormatter() // 특정 포맷으로 날짜를 보여주기 위한 변수 선언
        formatter.dateFormat = "HH:mm" // 날짜 포맷 지정
        DateTime.text = formatter.string(from: Date()) // 현재 시간 라벨에 지정한 날짜 포맷으로 입력
       // indicator.startAnimating()
        if isClickConfirm { // 얼럿 확인 버튼이 눌렸으면(true), 종료
            return
        }
        if SettingTime.text == DateTime.text { // 선택 시간과 현재 시간이 같으면
       
            //창 설정
           // indicator.stopAnimating()
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertAction.Style.default) { UIAlertAction in
                self.isClickConfirm = true // 얼럿 확인 버튼을 누르면, true 로 변경

                // 60초 후에 timerOn 함수를 실행시키는 타이머
                self.startTimer()
            })
            self.present(alert, animated: true, completion: nil) // 얼럿 실행
        }
    }
    func timerOn() {
        isClickConfirm = false // 초기화
    }
}
