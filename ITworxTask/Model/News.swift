//
//  News.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-08.
//

import Foundation

// MARK: - News
struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: Date?
    var content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
}
