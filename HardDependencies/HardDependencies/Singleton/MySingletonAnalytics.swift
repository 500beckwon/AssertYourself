//
//  MySingletonAnalytics.swift
//  HardDependencies
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import Foundation

class MySingletonAnalytics {
    static var shared: MySingletonAnalytics {
        if let stubbedInstance = stubbedInstance {
            return stubbedInstance
        }
        
        return instance
    }
    
    private static let instance = MySingletonAnalytics()
    
    static var stubbedInstance: MySingletonAnalytics?
    
    
    func track(event: String) {
        Analytics.shared.track(event: event)
        
        if self !== MySingletonAnalytics.instance {
            print(">> Not the MySingletonAnalyticss singleton")
        }
    }
}
