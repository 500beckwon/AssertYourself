//
//  MyActvitesTests.swift
//  LifeCycleTests
//
//  Created by ByungHoon Ann on 2023/04/07.
//

import XCTest
@testable import LifeCycle

class MyActivitesTests: XCTestCase {
    private var sut: MyActivites!
    
    
    override func setUp() {
        sut = MyActivites()
        super.setUp()
    }
     
    override func tearDown() {
        sut = nil
    }
    
//    func test_zero() {
//        XCTFail("Test Zero!")
//    }
    
    func test_methodOneNameEqual() {
        sut.methodOne()
        XCTAssertEqual(sut.currentMethodName, "methodOne")
    }
    
    func test_methodTwoNameEqual() {
        sut.methodTwo()
        XCTAssertEqual(sut.currentMethodName, "methodTwo")
    }
    
    func test_methodOneNameNotEqual() {
        sut.methodOne()
        XCTAssertNotEqual(sut.currentMethodName, "methodTwo")
    }
    
    func test_methodTwoNameNotEqual() {
        sut.methodTwo()
        XCTAssertNotEqual(sut.currentMethodName, "methodOne")
    }
}
