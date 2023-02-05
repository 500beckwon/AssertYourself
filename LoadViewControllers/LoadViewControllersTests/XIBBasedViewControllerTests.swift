//
//  XIBBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by ByungHoon Ann on 2023/02/05.
//

import XCTest
@testable import LoadViewControllers

class XIBBasedViewControllerTests: XCTestCase {
    func test_loading() {
        let sut = XIBBasedViewController()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.label)
    }
}
