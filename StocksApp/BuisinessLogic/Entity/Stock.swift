//
//  Stock.swift
//  promotionsApp
//
//  Created by Иван Миронов on 03.05.2021.
//

import Foundation

struct Stock {
    let companyName: String
    let symbol: String
    let price: Double
    let priceChange: Double?
    let open: Double?
    let low: Double?
    let high: Double?

    
    init(json: [String: Any]) throws {
        guard let companyName = json["companyName"] as? String,
              let symbol = json["symbol"] as? String,
              let price = json["latestPrice"] as? Double else {
        throw SystemError.mapping
        }
        
        self.companyName = companyName
        self.symbol = symbol
        self.price = price
        self.priceChange = json["change"] as? Double
        self.open = json["iexOpen"] as? Double
        self.low = json["week52Low"] as? Double
        self.high = json["week52High"] as? Double
    }
}

