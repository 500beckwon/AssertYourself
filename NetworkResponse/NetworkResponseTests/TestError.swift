//
//  TestError.swift
//  NetworkResponseTests
//
//  Created by ByungHoon Ann on 2023/02/23.
//

import Foundation

struct TestError: LocalizedError {
    let message: String

    var errorDescription: String? { message }
}
