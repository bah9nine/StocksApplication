//
//  PromotionsCell.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import UIKit

class StockCell: UITableViewCell {
    static let identifier: String = "StockCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var changePriceLabel: UILabel!
    
    func fill(_ stock: Stock) {
        if let price = stock.priceChange {
            changePriceLabel.text = price.description + " %"
            let color = price < 0 ? .red : #colorLiteral(red: 0, green: 0.5091661811, blue: 0.02552722581, alpha: 1)
            containerView.backgroundColor = color
        } else {
            changePriceLabel.isHidden = true
        }
        symbolLabel.text = stock.symbol
        companyNameLabel.text = stock.companyName
    }
}
