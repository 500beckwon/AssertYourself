//
//  CodeBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by ByungHoon Ann on 2023/02/05.
//

import XCTest
@testable import LoadViewControllers

class CodeBasedViewControllerTests: XCTestCase {
    func test_loading() {
        let sut = CodeBasedViewController(data: "DUMMY")
        sut.loadViewIfNeeded()
    }
}
