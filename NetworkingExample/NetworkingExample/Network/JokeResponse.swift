//
//  JokeResponse.swift
//  NetworkingExample
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import Foundation

struct JokeResponse: Decodable {
    let type: String
    let value: Joke
}

struct Joke: Decodable {
    let id: Int
    let joke: String
    let categories: [String]
}
