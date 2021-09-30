//
//  customReconnectButton.swift
//  StocksApp
//
//  Created by Иван Миронов on 05.05.2021.
//

import UIKit

class CustomReconnectButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupShadow()
        
        self.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        self.tintColor = .white
        layer.cornerRadius = 10
        self.setTitle("Try again", for: .normal)
    }
    
    func setupShadow() {
        let height = frame.height
        let width = frame.width
        
        let shadowSize: CGFloat = 20
        let shadowDistance: CGFloat = 20
        let contactRect = CGRect(x: -shadowSize, y: height - (shadowSize * 0.4) + shadowDistance, width: width + shadowSize * 2, height: shadowSize)
        layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.4
    }
}
