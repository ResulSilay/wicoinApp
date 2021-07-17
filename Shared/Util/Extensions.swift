//
//  Extensions.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 16.07.2021.
//

import Foundation

extension Double{
    
    func toString() -> String {
        return String(self)
    }
    
    func toFormatter() -> String {
        let price = self as NSNumber
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.string(from: price) // "$123.44"
        
        return formatter.string(from: price)!
    }
    
    func toRoundFormatter(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String{
    func toString() -> String {
        return String(self)
    }
}

extension Array where Element == String{
    
    func string() -> String {
        var items = ""
        self.forEach { Element in
            items.append(Element+",")
        }
        
        return items
    }
}

extension Int{
    
    func toString() -> String {
        return String(self)
    }
}
