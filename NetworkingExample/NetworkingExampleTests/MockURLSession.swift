//
//  MockURLSession.swift
//  NetworkingExampleTests
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import XCTest
@testable import NetworkingExample

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    
    var resumeDidCall: () -> Void

    init(resumeDidCall: @escaping () -> Void) {
        self.resumeDidCall = resumeDidCall
    }
    
    func resume() {
        resumeDidCall()
    }
}

class MockURLSession: URLSessionProtocol {
    var makeRequestFail = false
    
    init(makeRequestFail: Bool = false) {
        self.makeRequestFail = makeRequestFail
    }

    var sessionDataTask: MockURLSessionDataTask?

    // dataTask 를 구현합니다.
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {

        // 성공시 callback 으로 넘겨줄 response
        let successResponse = HTTPURLResponse(url: JokesAPI.randomJokes.url,
                                              statusCode: 200,
                                              httpVersion: "2",
                                              headerFields: nil)
        // 실패시 callback 으로 넘겨줄 response
        let failureResponse = HTTPURLResponse(url: JokesAPI.randomJokes.url,
                                              statusCode: 410,
                                              httpVersion: "2",
                                              headerFields: nil)

        let sessionDataTask = MockURLSessionDataTask {
            if self.makeRequestFail {
                completionHandler(nil, failureResponse, nil)
            } else {
                completionHandler(JokesAPI.randomJokes.sampleData, successResponse, nil)
            }
        }

        self.sessionDataTask = sessionDataTask
        return sessionDataTask
    }
}
