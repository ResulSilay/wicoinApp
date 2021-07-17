//
//  CoinInfoResponse.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class CoinInfoResponse: Decodable {
    let status: Status?
    let data: CoinInfoData?

    init(status: Status?, data: CoinInfoData?) {
        self.status = status
        self.data = data
    }
}

// MARK: - DataClass
class CoinInfoData: Decodable, Identifiable {
    let coinArray: [CoinInfoModel]
    
    private struct DynamicCodingKeys: CodingKey {

        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)

        var tempArray = [CoinInfoModel]()

        for key in container.allKeys {
            
            let decodedObject = try container.decode(CoinInfoModel.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }

        coinArray = tempArray
    }
}

// MARK: - The1027
class CoinInfoModel: Decodable {
    let id: Int?
    let name, symbol, category, description: String?
    let slug: String?
    let logo: String?
    let subreddit, notice: String?
    let tags, tagNames: [String]?
    let tagGroups: [TagGroup]?
    let urls: Urls?
    let platform: CoinPlatform?
    let dateAdded, twitterUsername: String?
    let isHidden: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, symbol, category
        case description
        case slug, logo, subreddit, notice, tags
        case tagNames = "tag_names"
        case tagGroups = "tag_groups"
        case urls, platform
        case dateAdded = "date_added"
        case twitterUsername = "twitter_username"
        case isHidden = "is_hidden"
    }

    init(id: Int?, name: String?, symbol: String?, category: String?, description: String?, slug: String?, logo: String?, subreddit: String?, notice: String?, tags: [String]?, tagNames: [String]?, tagGroups: [TagGroup]?, urls: Urls?, platform: CoinPlatform?, dateAdded: String?, twitterUsername: String?, isHidden: Int?) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.category = category
        self.description = description
        self.slug = slug
        self.logo = logo
        self.subreddit = subreddit
        self.notice = notice
        self.tags = tags
        self.tagNames = tagNames
        self.tagGroups = tagGroups
        self.urls = urls
        self.platform = platform
        self.dateAdded = dateAdded
        self.twitterUsername = twitterUsername
        self.isHidden = isHidden
    }
}

enum TagGroup: String, Codable {
    case consensusAlgorithm = "CONSENSUS_ALGORITHM"
    case other = "OTHER"
    case platform = "PLATFORM"
    case property = "PROPERTY"
}

// MARK: - Urls
class Urls: Codable {
    let website, twitter, messageBoard, chat: [String]?
    let explorer, reddit, technicalDoc, sourceCode: [String]?
    let announcement: [String]?

    enum CodingKeys: String, CodingKey {
        case website, twitter
        case messageBoard = "message_board"
        case chat, explorer, reddit
        case technicalDoc = "technical_doc"
        case sourceCode = "source_code"
        case announcement
    }

    init(website: [String]?, twitter: [String]?, messageBoard: [String]?, chat: [String]?, explorer: [String]?, reddit: [String]?, technicalDoc: [String]?, sourceCode: [String]?, announcement: [String]?) {
        self.website = website
        self.twitter = twitter
        self.messageBoard = messageBoard
        self.chat = chat
        self.explorer = explorer
        self.reddit = reddit
        self.technicalDoc = technicalDoc
        self.sourceCode = sourceCode
        self.announcement = announcement
    }
}

// MARK: - Platform
class CoinPlatform: Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let tokenAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case id,name,symbol,slug
        case tokenAddress = "token_address"
    }
    
    init(id: Int?, name: String?, symbol: String?, slug: String?, tokenAddress: String?) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.slug = slug
        self.tokenAddress = tokenAddress
    }
}
