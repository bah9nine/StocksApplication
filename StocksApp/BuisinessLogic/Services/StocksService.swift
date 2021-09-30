//
//  PromotionsService.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import Foundation

protocol StocksService {
    func getStocks(_ requestType: StocksType, _ completionHandler: @escaping ([Stock]?, Error?) -> Void)
    func getIcon(symbol: String, _ completionHandler: @escaping (URL?, Error?) -> Void)
}
