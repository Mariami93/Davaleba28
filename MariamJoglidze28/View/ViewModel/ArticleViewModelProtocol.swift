//
//  ArticleViewModelProtocol.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import UIKit

protocol ArticleViewModelProtocol: AnyObject {
    func fetchNewses(completion: @escaping (([NewsViewModel]) -> Void))
    func proceedToDetails(using newsViewModel: NewsViewModel)
    
    init(with apiManager: APIManagerProtocol, navigationController: UINavigationController?)
}

final class ArticleViewModel: ArticleViewModelProtocol {
    
    private var apiManager: APIManagerProtocol
    private var navigationController: UINavigationController?
    
    init(with apiManager: APIManagerProtocol, navigationController: UINavigationController?) {
        self.apiManager = apiManager
        self.navigationController = navigationController
    }
    
    func fetchNewses(completion: @escaping (([NewsViewModel]) -> Void)) {
        apiManager.fetchNews { article in
            completion(article.map { NewsViewModel(news: $0) })
        }
    }
    
    func proceedToDetails(using newsViewModel: NewsViewModel) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NewsDetailsViewController") as! NewsDetailsViewController
        vc.newsViewModel = newsViewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
