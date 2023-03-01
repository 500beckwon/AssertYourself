//
//  Main.swift
//  Refactoring
//
//  Created by ByungHoon Ann on 2023/03/01.
//

import UIKit

let appDelegateClass: AnyClass =
        NSClassFromString("TestingAppDelegate") ?? AppDelegate.self
UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
        nil,
        NSStringFromClass(appDelegateClass))
