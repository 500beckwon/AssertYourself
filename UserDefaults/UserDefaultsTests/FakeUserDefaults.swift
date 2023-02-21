//
//  FakeUserDefaults.swift
//  UserDefaultsTests
//
//  Created by ByungHoon Ann on 2023/02/21.
//

@testable import UserDefaults

class FakeUserDefaults: UserDefaultsProtocol {
    var integers: [String: Int] = [:]
    
    func set(_ value: Int, forKey defaultName: String) {
        integers[defaultName] = value
    }
    
    func integer(forKey defaultName: String) -> Int {
        return integers[defaultName] ?? 0
    }
}
