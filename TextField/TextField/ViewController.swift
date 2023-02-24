//
//  ViewController.swift
//  TextField
//
//  Created by ByungHoon Ann on 2023/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }

    deinit {
        print("ViewController.deinit")
    }
    
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        if textField === usernameTextField {
            return !string.contains(" ")
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField === usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            guard let username = usernameTextField.text,
                  let password = passwordTextField.text else {
                return false
            }
            passwordTextField.resignFirstResponder()
            performLogin(username: username, password: password)
        }
        return false
    }

    private func performLogin(username: String, password: String) {
        print("Username: \(username)")
        print("Password: \(password)")
    }
}

extension ViewController: UITextFieldDelegate { }
