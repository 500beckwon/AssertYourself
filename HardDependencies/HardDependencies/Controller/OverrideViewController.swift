//
//  OverrideViewController.swift
//  HardDependencies
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import UIKit

class OverrideViewController: UIViewController {
     func analytics() -> Analytics { Analytics.shared }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        analytics().track(event: "viewDidAppear - \(type(of: self))")
    }
}
