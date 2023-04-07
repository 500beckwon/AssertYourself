//
//  MyActivites.swift
//  LifeCycle
//
//  Created by ByungHoon Ann on 2023/04/07.
//

import Foundation

class MyActivites {
    private static var allInstances = 0
    private let instance: Int
    private var methodName = ""
    
    var currentMethodName: String {
        return methodName
    }
    
    init() {
        MyActivites.allInstances += 1
        instance = MyActivites.allInstances
        print(">> MyActivites.init() #\(instance)")
    }
    
    deinit {
        print(">> MyActivites.deinit #\(instance)")
    }
    
    func methodOne() {
        print(">> methodOne")
        methodName = "methodOne"
    }

    
    func methodTwo() {
        print(">> methodTwo")
        methodName = "methodTwo"
    }
}
