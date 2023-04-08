//
//  APIError.swift
//  NetworkingExample
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import Foundation

enum APIError: Error {
    case unknownError
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknownError:
            return NSLocalizedString("데이터가 존재하지 않습니다", comment: "unknownError")
        }
    }
}
