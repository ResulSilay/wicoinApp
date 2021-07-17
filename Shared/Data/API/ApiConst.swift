//
//  ApiConst.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 17.07.2021.
//

import Foundation

enum BaseUrls : String {
    case COIN = "https://pro-api.coinmarketcap.com"
    case NEWS = "https://newsdata.io"
}

class Headers {
    var key: String = ""
    var value: String = ""
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
}


struct ApiHeaders {
    
   static var shared = ApiHeaders()
    
    func coinDataHeaders() -> [Headers] {
        return [
            Headers(key: "X-CMC_PRO_API_KEY", value: "cee2a2bb-4e2e-43f1-8eb7-b383408ee60c")
        ]
    }
    
    func coinNewsHeaders() -> [Headers] {
        return [
            Headers(key: "X-ACCESS-KEY", value: "pub_5696354a6d8e9e44b6de645abe6630f0cd0")
        ]
    }
}
