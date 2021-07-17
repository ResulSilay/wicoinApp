//
//  ConversionResultResponse.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

// MARK: - Welcome
class ConversionResultResponse: Codable {
    let status: Status?
    let data: ConversionDataModel?

    init(status: Status?, data: ConversionDataModel?) {
        self.status = status
        self.data = data
    }
}

// MARK: - DataClass
class ConversionDataModel: Codable {
    let id: Int?
    let symbol, name: String?
    let amount: Int?
    let lastUpdated: String?
    let quote: ConversionQuote?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, amount
        case lastUpdated
        case quote
    }

    init(id: Int?, symbol: String?, name: String?, amount: Int?, lastUpdated: String?, quote: ConversionQuote?) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.amount = amount
        self.lastUpdated = lastUpdated
        self.quote = quote
    }
}

// MARK: - Quote
class ConversionQuote: Codable {
    
    let coinArray: [ConversionCoin]
    
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

        var tempArray = [ConversionCoin]()

        for key in container.allKeys {
            
            let decodedObject = try container.decode(ConversionCoin.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            tempArray.append(decodedObject)
        }

        coinArray = tempArray
    }
}

// MARK: - Usd
class ConversionCoin: Codable {
    let price: Double?
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case price
        case lastUpdated
    }

    init(price: Double?, lastUpdated: String?) {
        self.price = price
        self.lastUpdated = lastUpdated
    }
}

