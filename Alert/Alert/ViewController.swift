//
//  ViewController.swift
//  Alert
//
//  Created by ByungHoon Ann on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonTap(_ sender: Any) {
        let alert = UIAlertController(
            title: "Do the Thing?",
            message: "Let us know if you want to do the think",
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print(">> Cancel")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            print(">> OK")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        alert.preferredAction = okAction
        present(alert, animated: true)
    }
    
}

