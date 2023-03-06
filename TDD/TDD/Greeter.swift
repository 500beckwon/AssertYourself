//
//  Greeter.swift
//  TDD
//
//  Created by ByungHoon Ann on 2023/03/06.
//

import Foundation

struct Greeter {
    
    private let name: String
    
    typealias GreetingTime = (from: Int, greeting: String)
    
    private let greetingTimes: [GreetingTime] = [
        (0, "Good evening"),
        (5, "Good morning"),
        (12, "Good afternoon"),
        (17, "Good evening"),
        (24, "SENTINEL"),
    ]
    
    init(name: String) {
        self.name = name
    }
    
    func greet(time: Date) -> String {
        let hello = greeting(for: time)
        if name.isEmpty {
            return "\(hello)."
        } else {
            return "\(hello), \(name)."
        }
    }
    
    /*
     24시는 0시로 처리되므로 greetingTimes의 5번째 인자가 나올일은 없다
     */
    
    private func greeting(for time: Date) -> String {
        let theHour = hour(for: time)
        for (index, greetingTime) in greetingTimes.enumerated() {
            if greetingTime.from <= theHour &&
                       theHour < greetingTimes[index + 1].from {
                return greetingTime.greeting
            }
        }
        return ""
    }
    
    private func hour(for time: Date) -> Int {
        let components = Calendar.current.dateComponents([.hour], from: time)
        print(components)
        return components.hour ?? 0
    }
}
