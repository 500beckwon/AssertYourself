//
//  ViewControllerTests.swift
//  NetworkResponseTests
//
//  Created by ByungHoon Ann on 2023/02/23.
//

import UIKit
import XCTest
import ViewControllerPresentationSpy
@testable import NetworkResponse

private func response(statusCode: Int) -> HTTPURLResponse? {
    return HTTPURLResponse(
        url: URL(string: "http://DUMMY")!,
        statusCode: statusCode, httpVersion: nil, headerFields: nil
    )
}

@MainActor
final class ViewControllerTests: XCTestCase {
    private var alertVerifier: AlertVerifier!
    private var sut: ViewController!
    private var spyURLSession: SpyURLSession!
    
    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as? ViewController
        spyURLSession = SpyURLSession()
        
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    private func jsonData() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres": [
                        "Foo",
                        "Bar"
                    ]
                }
            ]
        }
        """.data(using: .utf8)!
    }
    
    private func badDataMissingGenres() -> Data {
        """
        {
            "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5
                }
            ]
        }
        """.data(using: .utf8)!
    }

    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        tap(sut.button)
        let handleResultsCalled = expectation(description: "handleResults called")
        sut.handleResults = { _ in
            
            handleResultsCalled.fulfill()
        }
   
        spyURLSession.dataTaskArgsCompletionHandler.first?(
            jsonData(), response(statusCode: 200), nil
            )
        waitForExpectations(timeout: 1.0)
        XCTAssertEqual(sut.results, [
            SearchResult(artistName: "Artist", trackName: "Track",
                    averageUserRating: 2.5, genres: ["Foo", "Bar"])
        ])
    }
    
    func test_searchForBookNetworkCall_비동기패스하면_결과값이_빈값으로_되는지() {
        tap(sut.button)

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                jsonData(), response(statusCode: 200), nil
        )

        XCTAssertEqual(sut.results, [])
    }
    
    func test_searchForBookNetworkCall_에러를_보내고_alert이_나타나는지() {
        tap(sut.button)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                nil, nil, TestError(message: "oh no")
        )

        waitForExpectations(timeout: 0.01)
        verifyErrorAlert(message: "oh no")
    }
    
    func test_searchForBookNetworkCall_비동기작업전에_alert이_출력이_안돼는지() {
        tap(sut.button)
      
        spyURLSession.dataTaskArgsCompletionHandler.first?(
                nil, nil, TestError(message: "DUMMY")
        )
        
        XCTAssertEqual(alertVerifier.presentedCount, 0)
    }
    
    func test_searchForBookNetworkCall_잘못된데이터를_내려주고_비동기작업전에_alert이_출력이_안돼는지() {
        tap(sut.button)

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                badDataMissingGenres(), response(statusCode: 200), nil
        )

        XCTAssertEqual(alertVerifier.presentedCount, 0)
    }
    
    func test_searchForBookNetworkCall_StatusCode가_200이아닐때_shouldShowAlert() {
        tap(sut.button)
        let alertShown = expectation(description: "alert shown")
        alertVerifier.testCompletion = {
            alertShown.fulfill()
        }

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                jsonData(), response(statusCode: 500), nil
        )

        waitForExpectations(timeout: 0.01)
        verifyErrorAlert(message: "Response: internal server error")
    }
    
    func test_searchForBookNetworkCall_StatusCode가_200이아닐때_비동기작업전에_alert이_표시가_안돼는지() {
        tap(sut.button)

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                jsonData(), response(statusCode: 500), nil
        )

        XCTAssertEqual(alertVerifier.presentedCount, 0)
    }
    
    func test_vc초기화후_button이_isEnable이_true인지() {
     //   tap(sut.button) <- 터치하면 false
        XCTAssertTrue(sut.button.isEnabled)
    }

    func test_searchForBookNetworkCall_shouldDisableButton() {
        tap(sut.button)
        
        XCTAssertFalse(sut.button.isEnabled)
    }
    
    func test_searchForBookNetworkCall_response가_성공값을반환한후_button_isEnable이true인지() {
        tap(sut.button)
        let handleResultsCalled = expectation(description: "handleResults called")
        sut.handleResults = { _ in
            handleResultsCalled.fulfill()
        }

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                jsonData(), response(statusCode: 200), nil
        )

        waitForExpectations(timeout: 0.01)
        XCTAssertTrue(sut.button.isEnabled)
    }
    
    func test_searchForBookNetworkCall_reponse성공값을넣고_비동기작업전에_button_isEnable값이_false인지() {
        tap(sut.button)

        spyURLSession.dataTaskArgsCompletionHandler.first?(
                jsonData(), response(statusCode: 200), nil
        )

        XCTAssertFalse(sut.button.isEnabled)
    }
    
    
    private func verifyErrorAlert(
            message: String, file: StaticString = #file, line: UInt = #line) {
        alertVerifier.verify(
                title: "Network problem",
                message: message,
                animated: true,
                actions: [
                    .default("OK"),
                ],
                presentingViewController: sut,
                file: file,
                line: line
        )
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK",
                "preferred action", file: file, line: line)
    }
    
    
}
