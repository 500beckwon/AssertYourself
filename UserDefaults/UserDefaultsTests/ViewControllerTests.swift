//
//  ViewControllerTests.swift
//  UserDefaultsTests
//
//  Created by ByungHoon Ann on 2023/02/21.
//

import XCTest
@testable import UserDefaults

class ViewControllerTests: XCTestCase {
    private var sut: ViewController!
    private var defaults: FakeUserDefaults!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        defaults = FakeUserDefaults()
        sut.userDefaults = defaults
    }
    
    override func tearDown() {
        sut = nil
        defaults = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_userDefault에_7을_넣고_countLabel이_7이_표시되는지() {
        defaults.integers = ["count": 7]
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.countLabel.text, "7")
    }
    
    func test_incrementButton을_탭하여_userDefault가_12에서_1을더하여_13으로_저장이_제대로_이루어지는지() {
        defaults.integers = ["count": 12]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)
        
        XCTAssertEqual(defaults.integers["count"], 13)
    }
    
    func test_incrementButton을_터치하여_UserDefaults가_42인_상태에서_countLabel이_43을_표시하여주는지() {
        defaults.integers = ["count": 42]
        sut.loadViewIfNeeded()
        
        tap(sut.incrementButton)

        XCTAssertEqual(sut.countLabel.text, "43")
    }
}

