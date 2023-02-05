//
//  StoryboardBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by ByungHoon Ann on 2023/02/05.
//

import XCTest
@testable import LoadViewControllers

class StoryboardBasedViewControllerTests: XCTestCase {
    func test_loading() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: StoryboardBasedViewController = sb.instantiateViewController(identifier: String(describing: StoryboardBasedViewController.self))
       // sut.loadViewIfNeeded() <- 호출 하면 nil이 아님
        XCTAssertNotNil(sut.label)
    }
}


