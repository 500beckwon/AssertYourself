//
//  AssertYourselfTests.swift
//  AssertYourselfTests
//
//  Created by ByungHoon Ann on 2023/02/01.
//

import XCTest
@testable import AssertYourself

final class AssertYourselfTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {

    }

    func testExample() throws {

    }

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_fail() {
        XCTFail("문제 발생")
    }
    
    func test_fail_withInterpolatedMessage() {
        let theAnswer = 42
        XCTFail("The Answer to the Great Question is \(theAnswer)")
    }
    
    // 추가 코드는 잘못될 수 있는 코드
    /// Avoid Conditionals in Tests
    func test_avoidConditionalCode() {
        let success = false
        if !success {
            XCTFail()
        }
    }
    
    func test_assertTrue() {
        let success = true
        XCTAssertTrue(success)
    }
    
    func test_assertFalse() {
        let success = false
        XCTAssertFalse(success)
    }
    // -- 10p
    
    func test_assertNil() {
        let optionalValue: Int? = 123
        XCTAssertNil(optionalValue)
    }
    
    func test_assertNotNil() {
        let optionalValue: Int? = 123
        XCTAssertNotNil(optionalValue)
    }
    
    func test_assertNil_withSimpleStruct() {
        let optionalValue: SimpleStruct? = SimpleStruct(x: 1, y: 1)
        XCTAssertNil(optionalValue)
    }
    
    /// Describe Objects upon Failure
    func test_assertNil_withSelfDescribingType() {
        let optionalValue: StructWithDesDescription? = StructWithDesDescription(x: 1, y: 2)
        XCTAssertNil(optionalValue)
    }
    
    /// Test for Equality
    func test_assertEqual() {
        let actual = "actual"
        XCTAssertEqual(actual, "expected")
    }
    
    /// Test Equality with Optionals
    func test_assertEqual_withOptional() {
        let result: String? = "foo"
        XCTAssertEqual(result, "bar")
    }
    
    /// Fudge Equality with Doubles and Floats
    func test_floatingPointDanger() {
        let result = 0.1 + 0.2
        // accuracy 정확도
        XCTAssertEqual(result, 0.3, accuracy: 0.0000000000000001)
        // 0.00000000000000001 == Failure! 0.0000000000000001 == Success!
        // test_floatingPointDanger(): XCTAssertEqual failed: ("0.30000000000000004") is not equal to ("0.3")
        // XCTAssertEqual(result, 0.3)
    }
    
    /// Avoid Redundant Messages
    func test_messageOverKill() {
        let actual = "actual"
        XCTAssertEqual(actual,
                       "expected",
                       "Expected \"expected\" but got \"\(actual)\"")
    }
}
