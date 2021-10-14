//
//  SignUpViewController.swift
//  29th-Assignment-Youtube
//
//  Created by 김수연 on 2021/10/06.
//

import UIKit

class SignUpViewController: UIViewController {
    

    // MARK: IBOutlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var showPasswordButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false
        setTextField()
    }
    
    // MARK: - Methods
    // MARK: Custom Method
    
    func setTextField() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0?.delegate = self
        }
    }
    
    // MARK: IBActions
    
    @IBAction func showPasswordButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            passwordTextField.isSecureTextEntry = false
            showPasswordButton.setImage(UIImage(systemName: "checkmark.square" ), for: .selected)
        } else {
            passwordTextField.isSecureTextEntry = true
            showPasswordButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as? WelcomeViewController else {return}
        
        welcomeVC.userName = nameTextField.text
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true, completion: nil)
        
    }
    

}

// MARK: - Extensions

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
}
