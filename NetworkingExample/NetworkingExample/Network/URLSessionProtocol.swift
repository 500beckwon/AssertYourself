//
//  URLSessionProtocol.swift
//  NetworkingExample
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
    
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return dataTask(with: request, completionHandler: completionHandler) as URLSessionDataTask
    }
}
