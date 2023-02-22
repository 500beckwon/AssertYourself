//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by ByungHoon Ann on 2023/02/22.
//

import Foundation
@testable import NetworkRequest
import XCTest

class ViewControllerTests: XCTestCase {
    var sut: ViewController!
    var mockURLSession: MockURLSession!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        mockURLSession = MockURLSession()
        
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville() {
        sut.session = mockURLSession
        sut.loadViewIfNeeded()
        tap(sut.button)
        XCTAssertEqual(
                mockURLSession.dataTaskArgsRequest.first,
                URLRequest(url: URL(string: "http://FOO")!),
                "request")

    }
    
    func test_tappingButton_shouldMakeDataTaskToSearchForEBookOutFromBoneville2() {
        sut.session = mockURLSession
        sut.loadViewIfNeeded()
        tap(sut.button)
        
                XCTAssertEqual(
                        mockURLSession.dataTaskArgsRequest.first,
                        URLRequest(url: URL(string: "https://itunes.apple.com/search?" +
                                "media=ebook&term=out%20from%20boneville")!),
                        "request")
    }
}
