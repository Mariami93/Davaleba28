//
//  APIManager.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import Foundation

protocol APIManagerProtocol: AnyObject {
    func fetchNews(completion: @escaping (([News]) -> Void))
}

class APIManager: APIManagerProtocol {

    func fetchNews(completion: @escaping (([News]) -> Void)) {
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2021-05-08&sortBy=publishedAt&apiKey=fcf82aa7daa7468893414e64804848f2"
        NetworkManager.shared.get(url: url) { (result: Result<Articles, Error>) in
            switch result {
            case .success(let response):
                completion(response.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
