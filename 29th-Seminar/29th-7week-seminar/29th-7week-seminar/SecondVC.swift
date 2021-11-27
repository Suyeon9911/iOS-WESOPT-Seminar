//
//  SecondVC.swift
//  29th-7week-seminar
//
//  Created by 김수연 on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {

    static let identifier = "SecondVC"
    @IBOutlet weak var dataTextField: UITextField!
    var recievedText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SecondVC 호출")
        dataTextField.text = recievedText
    }

    @IBAction func touchUpToSendData(_ sender: Any) {

        NotificationCenter.default.post(name: NSNotification.Name("iOS-sample"), object: dataTextField.text ?? "")

        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.dataTextField.text = dataTextField.text
        dismiss(animated: true, completion: nil)

    }

    func setDataInTextField(data: String) {
        print("넘겨받은 데이터 = \(data)")
    }
}
