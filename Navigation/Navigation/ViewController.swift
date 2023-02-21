//
//  ViewController.swift
//  Navigation
//
//  Created by ByungHoon Ann on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private(set) var codePushButton: UIButton!
    @IBOutlet private(set) var codeModalButton: UIButton!
    @IBOutlet private(set) var seguePushButton: UIButton!
    @IBOutlet private(set) var segueModalButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    deinit {
        print(">> ViewController.deinit")
    }

    @IBAction func pushNextViewController(_ sender: Any) {
        let nextVC = CodeNextViewController(labelText: "Pushed from code")
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    @IBAction func presentModalNextViewController(_ sender: Any) {
        let nextVC = CodeNextViewController(labelText: "Modal from code")
        present(nextVC, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "pushNext"?:
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            nextVC.labelText = "Pushed from segue"
        case "modalNext"?:
            guard let nextVC = segue.destination as? SegueNextViewController else { return }
            nextVC.labelText = "Modal from segue"
        default: return
        }
    }
}

