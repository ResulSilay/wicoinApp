//
//  ConversionRequest.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

class ConversionRequest {
    var id : Int?
    var amount : Double?
    
    
    init(id: Int?, amount:Double?) {
        self.id = id
        self.amount = amount
    }
}
