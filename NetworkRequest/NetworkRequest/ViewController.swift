//
//  ViewController.swift
//  NetworkRequest
//
//  Created by ByungHoon Ann on 2023/02/22.
//

import UIKit

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest,
                  completionHandler: @escaping(Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol {

}

class ViewController: UIViewController {
    @IBOutlet private(set) var button: UIButton!
    
    private var dataTask: URLSessionDataTask?
    
    var session: URLSessionProtocol = URLSession.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        searchForBook(terms: "out from boneville")
    }
 
    #if false
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://itunes.apple.com/search?" +
                            "media=ebook&term=\(encodedTerms)") else { return }
        let request = URLRequest(url: url)
        dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            let decode = String(data: data ?? Data(), encoding: .utf8)
            print("response \(String(describing: response))")
            print("data: \(String(describing: decode))")
            print("error: \(String(describing: error))")
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.dataTask = nil
                self.button.isEnabled = true
            }
        }
        
        dataTask?.resume()
    }
    #endif
    
    private func searchForBook(terms: String) {
        guard let encodedTerms = terms.addingPercentEncoding(
                withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "https://itunes.apple.com/search?" +
                      "media=ebook&term=\(encodedTerms)") else { return }
        let request = URLRequest(url: url)
        dataTask = session.dataTask(with: request) {
            [weak self] (data: Data?, response: URLResponse?, error: Error?)
                            -> Void in
            guard let self = self else { return }

            let decoded = String(data: data ?? Data(), encoding: .utf8)
            print("response: \(String(describing: response))")
            print("data: \(String(describing: decoded))")
            print("error: \(String(describing: error))")

            DispatchQueue.main.async {
                self.dataTask = nil
                self.button.isEnabled = true
            }
        }
        button.isEnabled = false
        dataTask?.resume()
    }
}

