//
//  NewsViewModel.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import Foundation

struct NewsViewModel {
    
    private var news: News
    
    init(news: News) {
        self.news = news
    }
    
    var title: String {
        news.title ?? ""
    }
    
    var description: String {
        news.description ?? ""
    }
    
    var imageUrl: URL? {
        URL(string: news.imageUrl ?? "")
    }
    
    var date: String {
        news.date ?? ""
    }
}
