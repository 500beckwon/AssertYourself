//
//  JokesAPIProvider.swift
//  NetworkingExample
//
//  Created by ByungHoon Ann on 2023/04/08.
//

import Foundation

class JokesAPIProvider {

    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func fetchRandomJoke(completion: @escaping (Result<Joke, Error>) -> Void) {
        let request = URLRequest(url: JokesAPI.randomJokes.url)

        let task: URLSessionDataTaskProtocol = session
            .dataTask(with: request) { data, urlResponse, error in
                guard let response = urlResponse as? HTTPURLResponse,
                      (200...399).contains(response.statusCode) else {
                    completion(.failure(error ?? APIError.unknownError))
                    return
                }

                if let data = data,
                    let jokeResponse = try? JSONDecoder().decode(JokeResponse.self, from: data) {
                    completion(.success(jokeResponse.value))
                    return
                }
                completion(.failure(APIError.unknownError))
        }

        task.resume()
    }
}
