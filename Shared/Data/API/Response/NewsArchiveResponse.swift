//
//  NewsArchiveResponse.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import Foundation

// MARK: - Welcome
class NewsArchiveResponse: Codable {
    let status: String?
    let totalResults: Int?
    let results: [NewsArchiveModel]?
    let nextPage: Int?

    init(status: String?, totalResults: Int?, results: [NewsArchiveModel]?, nextPage: Int?) {
        self.status = status
        self.totalResults = totalResults
        self.results = results
        self.nextPage = nextPage
    }
}

// MARK: - Result
class NewsArchiveModel: Codable, Identifiable {
    let title: String?
    let link: String?
    let keywords: [String]?
    let creator: [String]?
    let videoURL: String?
    let description, content: String?
    let pubDate: String?
    let imageURL: String?
    let sourceID: String?

    enum CodingKeys: String, CodingKey {
        case title, link, keywords, creator
        case videoURL
        case description
        case content, pubDate
        case imageURL = "image_url"
        case sourceID
    }

    init(title: String?, link: String?, keywords: [String]?, creator: [String]?, videoURL: String?, description: String?, content: String?, pubDate: String?, imageURL: String?, sourceID: String?) {
        self.title = title
        self.link = link
        self.keywords = keywords
        self.creator = creator
        self.videoURL = videoURL
        self.description = description
        self.content = content
        self.pubDate = pubDate
        self.imageURL = imageURL
        self.sourceID = sourceID
    }
}
