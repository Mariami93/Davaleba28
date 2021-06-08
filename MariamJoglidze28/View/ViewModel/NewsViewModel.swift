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
    
    func computeNewDate(from fromDate: Date, to toDate: Date) -> Date  {
         let delta = toDate.timeIntervalSince(fromDate)
         let today = Date()
         if delta < 0 {
             return today
         } else {
             return today.addingTimeInterval(delta)
         }
    }
    
    var date: String! {

//        news.date ?? ""
//        
//    }
//
        let calendar = NSCalendar.current
        let resevedDate = news.date!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
//        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
//
        let startDate = dateFormatter.date(from: resevedDate)!
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: startDate)
        let now = Date()
        let date2 = calendar.startOfDay(for: now)

        let components = calendar.dateComponents([.minute], from: startDate, to: now)
//
        return String(components.minute!) + " min ago"
    }
    
}
