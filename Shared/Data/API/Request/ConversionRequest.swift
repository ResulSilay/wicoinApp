//
//  ConversionRequest.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

class ConversionRequest {
    var id : Int?
    var convertId: Int?
    var amount : Double?
    
    init(id: Int?, convertId: Int?, amount:Double?) {
        self.id = id
        self.convertId = convertId
        self.amount = amount
    }
}
