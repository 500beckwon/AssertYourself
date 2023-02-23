//
//  SpyURLsession.swift
//  NetworkResponseTests
//
//  Created by ByungHoon Ann on 2023/02/23.
//

@testable import NetworkResponse
import Foundation

private class DummyURLSessionDataTask: URLSessionDataTask {
    override func resume() {
        
    }
}

class SpyURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    var dataTaskArgsCompletionHandler:
    [(Data?, URLResponse?, Error?) -> Void] = []
    
    func dataTask(
        with request: URLRequest,
        completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void
    ) -> URLSessionDataTask {
        print(completionHandler, "컴플")
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        return DummyURLSessionDataTask()
    }
}
