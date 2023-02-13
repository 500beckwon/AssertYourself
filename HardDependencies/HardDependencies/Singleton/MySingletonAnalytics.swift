//
//  MySingletonAnalytics.swift
//  HardDependencies
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import Foundation

class MySingletonAnalytics {
    static let shared = MySingletonAnalytics()
    
    func track(event: String) {
        Analytics.shared.track(event: event)
        
        if self !== MySingletonAnalytics.shared {
            print(">> Not the MySingletonAnalyticss singleton")
        }
    }
}
