//
//  ViewController.swift
//  29th-4week-seminar
//
//  Created by 김수연 on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpToLogin(_ sender: Any) {
        requestLogin()
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// 기능 단위로 extension ,, viewcontroller 안에 서버통신 코드가 들어가면 복잡해짐
extension ViewController {
    func requestLogin(){
        UserSignService.shared.login(email: emailTextField.text ?? "" ,
                                     password: passwordTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message,
                                     message: "\(userData.name)님 환영합니다!")
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

