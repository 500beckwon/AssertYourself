//
//  ViewController.swift
//  Refactoring
//
//  Created by ByungHoon Ann on 2023/03/01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "changePassword" {
            let changePasswordVC = segue.destination
                    as? ChangePasswordViewController
            changePasswordVC?.securityToken = "TOKEN"
        }
    }
}

