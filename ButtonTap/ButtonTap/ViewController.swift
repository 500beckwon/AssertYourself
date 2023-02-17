//
//  ViewController.swift
//  ButtonTap
//
//  Created by ByungHoon Ann on 2023/02/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func buttonTap(_ sender: Any) {
        print(">> Button was Tapped")
    }
}

