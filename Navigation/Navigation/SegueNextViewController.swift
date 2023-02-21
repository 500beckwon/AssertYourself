//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by ByungHoon Ann on 2023/02/20.
//

import UIKit

class SegueNextViewController: UIViewController {
    var labelText: String?
    
    @IBOutlet private(set) var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }
}


