//
//  StructWithDesDescription.swift
//  AssertYourselfTests
//
//  Created by ByungHoon Ann on 2023/02/02.
//

import Foundation

struct StructWithDesDescription: CustomStringConvertible {
    let x: Int
    let y: Int
    
    var description: String {
        return "(x = \(x), y = \(y))"
    }
}
