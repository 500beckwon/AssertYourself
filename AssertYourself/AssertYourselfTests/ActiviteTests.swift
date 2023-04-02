//
//  ActiviteTests.swift
//  AssertYourselfTests
//
//  Created by ByungHoon Ann on 2023/03/30.
//

import XCTest

/*
 Activities
 Now it’s time for you to put this chapter into action. Read through this list, pick one of the activities, and do it. It’s only in doing that we actually learn.
 1. Read Apple’s documentation of test assertions so you know what your other options are.
 
 2. Is there any production code you can begin testing today? Look for low- hanging fruit—functions that use only their input arguments to calculate a return value. This includes failable initializers: write one test checking for a nil return value and another for non-nil. (Pro tip: Any time you add a new test, make sure you see it fail by temporarily breaking the production code.)
 
 3. If your code already has some unit tests, then do the following:
     a. Read through the tests you have.
     b. Select a simulator, and press D-U to run your own tests. Make sure they all pass. If there are any test failures, delete those tests.
     c. Is each test using the best assertion for the job? Improve any you can.
     d. Check calls to XCTAssertEqual() to see if the argument order is consistent. Try to stick to a consistent order for actual/expected.
     e. Look for any XCTAssertEqual() assertions that compare floating-point numbers. Do they use the accuracy parameter? Add any that are missing.
     f. Consider whether there are any optional assertion messages you can delete because they’re redundant.
     g. Add descriptive messages to any XCTFail() assertions that are missing them.
     h. If you’ve changed any assertions or messages, make sure their failure output is helpful. You can check this by introducing temporary errors in either the test code or the production code. Afterward, don’t forget to remove these errors, then run the tests to make sure they pass.
 */
final class ActiviteTests: XCTestCase {
    
    func test_1과2를_더하면_3이된다() {
        let a = 1
        let b = 2
        XCTAssertEqual(a+b, 3)
    }
    
    func test_int배열에_값을_추가하고_count가_1개_증가했다() {
        var countList = [1,2,3,4]
        countList.append(5)
        XCTAssertEqual(countList.count, 5)
    }
    
    func test_값이없는_int옵셔널_변수의_값을_언랩핑하면_nil이다() {
        let count: Int? = nil
        XCTAssertEqual(nil, count)
    }
    
    func test_SimpleStruct의_plus_함수의_리턴값이_다르다() {
        let result = 5
        let simpleStruct = SimpleStruct(x: 5, y: 1)
        let simplePlusResult = simpleStruct.plus()
        XCTAssertNotEqual(result, simplePlusResult)
    }
}

final class ActivityFailTests: XCTestCase {
    func test_fail에_대한_값을_반환한다() {
        XCTFail("실패 반환 테스트")
    }
}
