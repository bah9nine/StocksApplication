//
//  PromotionsIO.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import Foundation

protocol StocksViewInput: AnyObject, BaseViewInput {
    func setupInitialState()
    func reloadData(stocks: [Stock])
    func prepareForRequest()
    func showStoks()
    func showReconnectButton()
}

protocol StocksViewOutput {
    func viewIsReady()
    func getStocks(type: StocksType)
}
