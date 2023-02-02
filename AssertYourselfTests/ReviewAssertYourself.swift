//
//  ReviewAssertYourself.swift
//  AssertYourselfTests
//
//  Created by ByungHoon Ann on 2023/02/02.
//

import XCTest

/// 1장 Assert Yourself 복습 파일

final class ReviewAssertYourself: XCTestCase {

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
        XCTFail("문제 발생했다")
    }
    
    func test_fail_withInterpolatedMessage() {
        let statsCode = 503
        XCTFail("통신 에러 Status Code = \(statsCode)")
    }
    
    // 추가 코드는 잘못될 수 있는 코드
    /// Avoid Conditionals in Tests
    func test_avoidConditionalCode() {
        let success = true
        if !success {
            XCTFail()
        }
    }
    
    func test_assertTrue() {
        let success = false
        XCTAssertTrue(success)
    }
    
    func test_assertFalse() {
        let success = false
        XCTAssertFalse(success)
    }

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
        let result: Float? = 0.01
        XCTAssertEqual(result, 0.01)
    }
    
    /// Fudge Equality with Doubles and Floats
    func test_floatingPointDanger() {
        let result = 0.00000004 + 0.000000042
        // accuracy 정확도
        XCTAssertEqual(result, 0.000000082, accuracy: 0.000000001)
        // test_floatingPointDanger(): XCTAssertEqual failed: ("0.30000000000000004") is not equal to ("0.3")
        // XCTAssertEqual(result, 0.3)
    }
    
    /// Avoid Redundant Messages
    func test_messageOverKill() {
        let expected = "expected"
        XCTAssertEqual(expected,
                       "expected",
                       "Expected \"expected\" but got \"\(expected)\"")
    }
}


