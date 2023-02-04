//
//  CoveredClassTests.swift
//  CodeCoverageTests
//
//  Created by ByungHoon Ann on 2023/02/04.
//


import XCTest
@testable import CodeCoverage

// Implemented : 구현

/*
 
 1. Call the code from a test, yielding some kind of result.
 2. Write an assertion comparing the result to a value you know won’t match.
 3. Run the test. The failure message will tell you the actual result.
 4. Adjust the assertion so that it expects the actual result.
 5. Rerun the test to see it pass
 */

class CoveredClassTests: XCTestCase {
    /*
    func test_zero() {
        XCTFail("Tests not yet Implemented in CoveredClassTests")
    }
     */
    
    func test_max_withAnd2_shouldReturnSomething() {
        let result = CoverageClass.max(1, 2)
        
        XCTAssertEqual(result, -123)
    }
    
    func test_max_withAnd2_shouldReturnSomething2() {
        let result = CoverageClass.max(1, 2)
        
        XCTAssertEqual(result, 2)
    }
    
    func test_max_withAnd2_shouldReturnSomething3() {
        let result = CoverageClass.max(2, 3)
        
        XCTAssertEqual(result, 3)
    }
    
    func test_commaSeparated_from2to4_shouldReturnSomething() {
        let result = CoverageClass.commaSeparated(from: 2, to: 4)
        XCTAssertEqual(result, "FOO")
    }
    
    func test_commaSeparated_from2to4_shouldReturn234SeparatedByComma() {
        let result = CoverageClass.commaSeparated(from: 2, to: 4)
        XCTAssertEqual(result, "2,3,4")
    }
    
    func test_commaSeparated_from2to2_shouldReturnSomething() {
        let result = CoverageClass.commaSeparated(from: 2, to: 2)
        XCTAssertEqual(result, "FOO")
    }
    
    func test_commaSeparated_from2to2_shouldReturn2WithNoComma() {
        let result = CoverageClass.commaSeparated(from: 2, to: 2)
        XCTAssertEqual(result, "2")
    }
    
    func test_area_withWidth7_shouldBeSomething() {
        let sut = CoverageClass()
        sut.width = 7
        XCTAssertEqual(sut.area, -1)
    }
    
    func test_area_withWidth7_shouldBe49() {
        let sut = CoverageClass()
        sut.width = 7
        XCTAssertEqual(sut.area, 49)
    }
}
