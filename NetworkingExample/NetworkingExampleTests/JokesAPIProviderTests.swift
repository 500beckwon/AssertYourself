//
//  JokesAPIProviderTests.swift
//  NetworkingExampleTests
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import XCTest
@testable import NetworkingExample

class JokesAPIProviderTests: XCTestCase {

    var sut: JokesAPIProvider!

    override func setUpWithError() throws {
        sut = .init(session: MockURLSession())
    }

    func test_fetchRandomJoke() {
        let expectation = XCTestExpectation()
        let response = try? JSONDecoder().decode(JokeResponse.self,
                                                 from: JokesAPI.randomJokes.sampleData)

        sut.fetchRandomJoke { result in
            switch result {
            case .success(let joke):
                print(joke)
                XCTAssertEqual(joke.id, response?.value.id)
                XCTAssertEqual(joke.joke, response?.value.joke)
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }

    func test_fetchRandomJoke_failure() {
        sut = .init(session: MockURLSession(makeRequestFail: true))
        let expectation = XCTestExpectation()

        sut.fetchRandomJoke { result in
            switch result {
            case .success:
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "데이터가 존재하지 않습니다")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 2.0)
    }
}
