//
//  SpyNavigationController.swift
//  NavigationTests
//
//  Created by ByungHoon Ann on 2023/02/21.
//

import UIKit

class SpyNavigationController: UINavigationController {
    private(set) var pushViewControllerArgsAnimated: [Bool] = []

    override func pushViewController(
        _ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        pushViewControllerArgsAnimated.append(animated)
    }
}
