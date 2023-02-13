//
//  OverrideViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by ByungHoon Ann on 2023/02/07.
//

import XCTest
@testable import HardDependencies

private class TestOverrideViewController: OverrideViewController {
    override func analytics() -> Analytics { Analytics() }
}

final class OverrideViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let sut = TestOverrideViewController()
        sut.loadViewIfNeeded()
        sut.viewDidAppear(false)
    }
   
}
