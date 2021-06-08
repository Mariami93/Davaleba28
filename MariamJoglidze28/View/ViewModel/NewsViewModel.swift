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
    
    var date: String! {

        news.date ?? ""
        
    }
//        let calendar = NSCalendar.current
//
//        let resevedDate = news.date ?? ""
//        let dateFormatter = DateFormatter()
//        guard let startDate = dateFormatter.date(from: resevedDate) else { return "0" }
//        // Replace the hour (time) of both dates with 00:00
//        let date1 = calendar.startOfDay(for: startDate)
//        let now = Date()
//        let date2 = calendar.startOfDay(for: now)
//
//        let flags = NSCalendar.Unit.day
//        let components = calendar.dateComponents([.day], from: date1, to: date2)
//
//        return "\(components.day)"
//    }
    
}
