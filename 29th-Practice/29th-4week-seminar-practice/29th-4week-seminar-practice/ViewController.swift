//
//  ViewController.swift
//  29th-4week-seminar-practice
//
//  Created by 김수연 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpToLogin(_ sender: Any) {
        requestLogin()
    }
    
    // 서버통신 후 잘 되었는지 확인하기 위해 alert창을 띄우기 위한 함수
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title ,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// 열심히 정제해서 넘겨준 NetworkResult를 사용
// 만약 statuscode가 200이었다면 담아져있는 객체는 loginresponseData 타입이지만 any라는 상위타입으로 형변환 되어있기 때문에
// as? 로 다시 loginresponseData 타입으로 만들어주고, 실패할 경우를 대비해서 data는 옵셔널 타입으로넣어놨으니
// 옵셔널 바인딩하여 안전하게 data를 꺼내어 simpleAlert 파라미터에 값을 넣어주자

extension ViewController {
    func requestLogin(){
        UserSignService.shared.login(email: emailTextField.text ?? "" , password: passwordTextField.text ?? "") { reponseData in
            switch reponseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message, message: "\(userData.name)님 환영합니다!")
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
