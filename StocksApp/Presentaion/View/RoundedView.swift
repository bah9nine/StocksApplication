//
//  RoundedView.swift
//  StocksApp
//
//  Created by Иван Миронов on 03.05.2021.
//

import UIKit

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

