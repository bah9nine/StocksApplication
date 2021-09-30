//
//  PromotionsServiceImp.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import Foundation
import Alamofire


class StocksServiceImp: StocksService {
    static var shared = StocksServiceImp()
//    private let baseUrl = "https://sandbox.iexapis.com/stable"
    private let baseUrl = "https://cloud.iexapis.com/"
    private init() {}
    
    func getStocks(_ stocks: StocksType, _ completionHandler: @escaping ([Stock]?, Error?) -> Void) {
        let url = "\(baseUrl)/stable/stock/market/list/\(stocks.type)"
        let param: Parameters = ["token": "pk_773eb3e17c87485d8f2a31213bbd0db7"]
        
        AF.request(url,parameters: param).validate().responseJSON { (response) in
            
            switch response.result {
            
            case .success(let value):
                do {
                    guard let json = value as? [[String: Any]] else {
                        throw SystemError.requestProblem
                    }
                    var stocksArray: [Stock] = []
                    
                    for obj in json {
                        let stock = try Stock(json: obj)
                        stocksArray.append(stock)
                    }
                    completionHandler(stocksArray,nil)
                } catch {
                    completionHandler(nil, error)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func getIcon(symbol: String, _ completionHandler: @escaping (URL?, Error?) -> Void) {
        let url = "\(baseUrl)/stable/stock/\(symbol)/logo/"
        let param: Parameters = ["token" : "pk_773eb3e17c87485d8f2a31213bbd0db7"]
        
        AF.request(url, parameters: param).validate().responseJSON { (response) in
            
            switch response.result {
            
            case .success(let value):
                do {
                    guard let data = value as? [String: Any],
                          let url = data["url"] as? String else {
                        throw SystemError.requestProblem
                    }
                    let iconUrl = URL(string: url)
                    completionHandler(iconUrl,nil)
                }
                catch {
                    completionHandler(nil, error)
                }
                
            case .failure(let error):
                completionHandler(nil,error)
            }
        }
    }
}

