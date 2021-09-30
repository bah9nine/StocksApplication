//
//  PromotionsPresenter.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import Foundation

class StocksPresenter: StocksViewOutput {
    weak var view: StocksViewInput!
    var stocksService: StocksService = StocksServiceImp.shared
    
    init(view: StocksViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
        getStocks(type: .mostActive)
    }
    
    func getStocks(type: StocksType) {
        view.prepareForRequest()
        stocksService.getStocks(type) { [weak self] (array, error) in
            guard let self = self else {
                return
            }
            if let stocksArray = array {
                self.view.reloadData(stocks: stocksArray)
                self.view.showStoks()
            }
            if let error = error {
                self.view.show(error)
                self.view.showReconnectButton()
            }
        }
    }
}
