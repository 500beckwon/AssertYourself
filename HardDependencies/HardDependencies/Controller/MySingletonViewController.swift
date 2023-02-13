//
//  MySingletonViewController.swift
//  HardDependencies
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import UIKit

class MySingletonViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MySingletonAnalytics.shared.track(event: "viewDidAppear - \(type(of: self))")
    }
}
