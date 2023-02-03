//
//  MyClassTests.swift
//  LifeCycleTests
//
//  Created by ByungHoon Ann on 2023/02/03.
//

import XCTest
@testable import LifeCycle

// Arrange, Act, Assert
class MyClassTests: XCTestCase {
    // sut = MyClass() 식으로 초기화 하지 않으면 인스턴스 소멸이 x
    private var sut: MyClass!
    
    // 시작 전
    override func setUp() {
        super.setUp()
        sut = MyClass()
    }
    
    // 속성 유지 정리을 위한 함수
    //Every property you create in setUp() should be destroyed in tearDown().
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    /*
     xUnitTest의 기본 4단계(설정 -> 호출 -> 확인 -> 소멸(파괴)
     1. The test creates an instance of MyClass. 인스턴스 생성
     2. It invokes a method on the instance. 인스턴스 메소드 호출
     3. It asserts an outcome. 결과확인
     4. It destroys the instance. 소멸
     */
    func test_methodOne() {
        sut.methodOne()
        // Normally, assert something
        XCTFail("Failed, Yo")
    }

    func test_methodOne2() {
        sut.methodOne()
        // Normally, assert something
    }
     
    func test_methodTwo() {
        let sut = MyClass()
        sut.methodTwo()
        // Normally, assert something
    }
    

}
