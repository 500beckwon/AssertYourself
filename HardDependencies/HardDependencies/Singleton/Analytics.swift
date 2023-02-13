//
//  Analytics.swift
//  HardDependencies
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import Foundation

class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print(">>" + event)
        
        if self !== Analytics.shared {
            print(">> ...Not the Analytics signleton")
        }
    }
}
