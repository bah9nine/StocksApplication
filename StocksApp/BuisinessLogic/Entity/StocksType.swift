//
//  RequestType.swift
//  StocksApp
//
//  Created by Иван Миронов on 03.05.2021.
//

import Foundation

enum StocksType: Int, CaseIterable {
    case mostActive
    case gainers
    case losers
    
    var type: String {
        switch self {
        case .gainers:
            return "gainers"
        case .losers:
            return "losers"
        case .mostActive:
            return "mostactive"
        }
    }
    
    var title: String {
        switch self {
        case .gainers:
            return "Gainers"
        case .losers:
            return "Losers"
        case .mostActive:
            return "Most active"
        }
    }
}
