//
//  JokesAPI.swift
//  NetworkingExample
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import Foundation

enum JokesAPI {
    static let baseURL = "https://api.icndb.com/"

    case randomJokes
}

extension JokesAPI {
    var path: String {
        return ""
    }
    
    var url: URL {
        return URL(fileURLWithPath: "")
    }
    
    var sampleData: Data {
        Data(
            """
                {
                   "type": "success",
                   "value": {
                   "id": 448,
                   "joke": "When Chuck Norris throws exceptions, it's across the room.",
                   "categories": []
                    }
                }
            """.utf8
        )
    }
}

