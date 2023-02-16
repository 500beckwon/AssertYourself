//
//  OutletConnectionsViewControllerTests.swift
//  OutletConnectionsViewControllerTests
//
//  Created by ByungHoon Ann on 2023/02/16.
//

import XCTest
@testable import OutletConnectionsViewController

class OutletConnectionsViewControllerTests: XCTestCase {
    
    func test_outlets_shouldBeConnected() {
        let sut = OutletConnectionsViewController()
        sut.loadViewIfNeeded()
        
        // private(set) 일 경우 Nil처리 됨
        XCTAssertNil(sut.label, "label")
        XCTAssertNil(sut.button, "button")
    }
}
