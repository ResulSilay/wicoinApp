//
//  CoinLatestResponse.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 15.07.2021.
//

import Foundation

// MARK: - Welcome
class CoinLatestResponse: Codable {
    let status: Status?
    let data: [CoinDataModel]?
    
    init(status: Status?, data: [CoinDataModel]?) {
        self.status = status
        self.data = data
    }
}

// MARK: - Datum
class CoinDataModel: Codable, Identifiable {
    let id: Int?
    let name, symbol, slug: String?
    let numMarketPairs: Int?
    let dateAdded: String?
    let tags: [String]?
    let maxSupply: Int?
    let circulatingSupply, totalSupply: Double?
    let platform: Platform?
    let cmcRank: Int?
    let lastUpdated: String?
    let quote: Quote?
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case numMarketPairs = "num_market_pairs"
        case dateAdded = "date_added"
        case tags
        case maxSupply = "max_supply"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case platform
        case cmcRank = "cmc_rank"
        case lastUpdated = "last_updated"
        case quote
    }
    
    init(id: Int?, name: String?, symbol: String?, slug: String?, numMarketPairs: Int?, dateAdded: String?, tags: [String]?, maxSupply: Int?, circulatingSupply: Double?, totalSupply: Double?, platform: Platform?, cmcRank: Int?, lastUpdated: String?, quote: Quote?) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.slug = slug
        self.numMarketPairs = numMarketPairs
        self.dateAdded = dateAdded
        self.tags = tags
        self.maxSupply = maxSupply
        self.circulatingSupply = circulatingSupply
        self.totalSupply = totalSupply
        self.platform = platform
        self.cmcRank = cmcRank
        self.lastUpdated = lastUpdated
        self.quote = quote
    }
}

// MARK: - Platform
class Platform: Codable {
    let id: Int?
    let name: Name?
    let symbol: Symbol?
    let slug: Slug?
    let tokenAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, symbol, slug
        case tokenAddress = "token_address"
    }
    
    init(id: Int?, name: Name?, symbol: Symbol?, slug: Slug?, tokenAddress: String?) {
        self.id = id
        self.name = name
        self.symbol = symbol
        self.slug = slug
        self.tokenAddress = tokenAddress
    }
}

enum Name: String, Codable {
    case binanceChain = "Binance Chain"
    case binanceSmartChain = "Binance Smart Chain"
    case ethereum = "Ethereum"
    case tron = "Tron"
}

enum Slug: String, Codable {
    case binanceCoin = "binance-coin"
    case ethereum = "ethereum"
    case tron = "tron"
}

enum Symbol: String, Codable {
    case bnb = "BNB"
    case eth = "ETH"
    case trx = "TRX"
}

// MARK: - Quote
class Quote: Codable {
    let usd: Usd?
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
    
    init(usd: Usd?) {
        self.usd = usd
    }
}

// MARK: - Usd
class Usd: Codable {
    let price, volume24H, percentChange1H, percentChange24H: Double?
    let percentChange7D, percentChange30D, percentChange60D, percentChange90D: Double?
    let marketCap: Double?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case price
        case volume24H = "volume_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange24H = "percent_change_24h"
        case percentChange7D = "percent_change_7d"
        case percentChange30D = "percent_change_30d"
        case percentChange60D = "percent_change_60d"
        case percentChange90D = "percent_change_90d"
        case marketCap = "market_cap"
        case lastUpdated = "last_updated"
    }
    
    init(price: Double?, volume24H: Double?, percentChange1H: Double?, percentChange24H: Double?, percentChange7D: Double?, percentChange30D: Double?, percentChange60D: Double?, percentChange90D: Double?, marketCap: Double?, lastUpdated: String?) {
        self.price = price
        self.volume24H = volume24H
        self.percentChange1H = percentChange1H
        self.percentChange24H = percentChange24H
        self.percentChange7D = percentChange7D
        self.percentChange30D = percentChange30D
        self.percentChange60D = percentChange60D
        self.percentChange90D = percentChange90D
        self.marketCap = marketCap
        self.lastUpdated = lastUpdated
    }
}

// MARK: - Status
class Status: Codable {
    let timestamp: String?
    let errorCode: Int?
    let errorMessage: String?
    let elapsed, creditCount: Int?
    let notice: String?
    let totalCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case timestamp
        case errorCode = "error_code"
        case errorMessage = "error_message"
        case elapsed
        case creditCount = "credit_count"
        case notice
        case totalCount = "total_count"
    }
    
    init(timestamp: String?, errorCode: Int?, errorMessage: String?, elapsed: Int?, creditCount: Int?, notice: String?, totalCount: Int?) {
        self.timestamp = timestamp
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.elapsed = elapsed
        self.creditCount = creditCount
        self.notice = notice
        self.totalCount = totalCount
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
