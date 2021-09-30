//
//  DetaliedPresenter.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import Foundation

class DetiledPresenter: DetailedViewOutput {
    weak var view: DetailedViewInput!
    let service: StocksService = StocksServiceImp.shared
    
    init(view: DetailedViewInput) {
        self.view = view
    }
    
    func viewIsReady() {
        view.setupInitialState()
    }
    
    func getIcon(by symbol: String) {
        service.getIcon(symbol: symbol) { (url, error) in
            if let iconUrl = url {
                self.view.setupIcon(url: iconUrl)
            }
            if let error = error {
                self.view.show(error)
            }
        }
    }
}
