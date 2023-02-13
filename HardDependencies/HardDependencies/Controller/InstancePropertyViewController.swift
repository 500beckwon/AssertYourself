//
//  InstancePropertyViewController.swift
//  HardDependencies
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import UIKit

class InstancePropertyViewController: UIViewController {
     lazy var analytics = Analytics()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        analytics.track(event: "viewDidAppear - \(type(of: self))")
    }
}
