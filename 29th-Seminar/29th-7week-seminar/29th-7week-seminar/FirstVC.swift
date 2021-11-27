//
//  FirstVC.swift
//  29th-7week-seminar
//
//  Created by 김수연 on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {

    static let identifier = "FirstVC"
    @IBOutlet weak var dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }

        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived), name: NSNotification.Name("iOS-sample"), object: nil)
//        //nextVC.setDataInTextField(data: dataTextField.text ?? "")
//        nextVC.recievedText = dataTextField.text ?? ""
//
        present(nextVC, animated: true, completion: nil)


    }

    @objc func dataReceived(notification: NSNotification) {
        if let text = notification.object as? String {
            dataTextField.text = text
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "presentSecondVC" {
//            let nextVC = segue.destination as? SecondVC
//            nextVC?.recievedText = dataTextField.text ?? ""
//        }

}
