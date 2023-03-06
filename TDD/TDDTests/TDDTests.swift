//
//  TDDTests.swift
//  TDDTests
//
//  Created by ByungHoon Ann on 2023/03/06.
//

import XCTest
@testable import TDD

final class TDDTests: XCTestCase {
    var sut: Greeter!
    
    override func setUp() {
        super.setUp()
        sut = Greeter(name: "")
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    
    func test_greet_11시59분일때_GoodMorning을리턴하는지() {
        let result = sut.greet(time: date(hour: 11, minute: 59))
        XCTAssertEqual(result, "Good morning.")
    }
    
    func test_greet_12시00분일때_Good_Afternoon을_리턴하는지() {
        let result = sut.greet(time: date(hour: 12, minute: 00))
        XCTAssertEqual(result, "Good afternoon.")
    }
    
    func test_greet_14시00분일떼_Good_afternoon을_리턴하는지() {
        let result = sut.greet(time: date(hour: 14, minute: 00))
        XCTAssertEqual(result, "Good afternoon.")
    }

    func test_greet_16시59분일때_Good_afternoon을_리턴하는지() {
        let result = sut.greet(time: date(hour: 16, minute: 59))
        XCTAssertEqual(result, "Good afternoon.")
    }

    func test_greet_17시00분일때_Good_Evening을_리턴하는지() {
        let result = sut.greet(time: date(hour: 17, minute: 00))
        XCTAssertEqual(result, "Good evening.")
    }

    func test_greet_23시59분일때_Good_evening을_리턴하는지() {
        let result = sut.greet(time: date(hour: 23, minute: 59))
        XCTAssertEqual(result, "Good evening.")
    }

    func test_greet_20시일때_Good_evening을_리턴하는지() {
        let result = sut.greet(time: date(hour: 20, minute: 00))
        XCTAssertEqual(result, "Good evening.")
    }

    func test_greet_00시일때_Good_evening을_리턴하는지() {
        let result = sut.greet(time: date(hour: 0, minute: 00))
        XCTAssertEqual(result, "Good evening.")
    }

    func test_greet_4시59분일때_Good_evening을리턴하는지() {
        let result = sut.greet(time: date(hour: 4, minute: 59))
        XCTAssertEqual(result, "Good evening.")
    }

    func test_greet_2시00분일때_Good_evening을_리턴하는지() {
        let result = sut.greet(time: date(hour: 2, minute: 00))
        XCTAssertEqual(result, "Good evening.")
    }
    
    func test_greet_24시일때_Good_evening을_리턴하는지() {
        let result = sut.greet(time: date(hour: 24, minute: 00))
        XCTAssertEqual(result, "Good evening.")
    }
}

private func date(hour: Int, minute: Int) -> Date {
    let components = DateComponents(
            calendar: Calendar.current, hour: hour, minute: minute)
    return components.date!
}
