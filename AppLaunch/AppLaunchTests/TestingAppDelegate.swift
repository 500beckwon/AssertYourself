//
//  TestingAppDelegate.swift
//  AppLaunchTests
//
//  Created by ByungHoon Ann on 2023/02/05.
//

import UIKit

@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(">> Launching with real app delegate")

        return true
    }
}
