//
//  StockDisplayManagerDelegate.swift
//  StocksApp
//
//  Created by Иван Миронов on 03.05.2021.
//

import Foundation

protocol StocksDisplayManagerDelegate: class {
    func stocksDisplayManager(_ stocksDisplayManager: StocksDisplayManager, didSelected stock: Stock)
}
