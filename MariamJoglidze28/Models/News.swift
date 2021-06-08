//
//  News.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import Foundation

struct News: Codable {
    let title: String?
    let imageUrl: String?
    let description: String?
    let date: String?
    
    enum CodingKeys: String, CodingKey {
        case title, description
        case imageUrl = "urlToImage"
        case date = "publishedAt"
    }
}
