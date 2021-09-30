//
//  DetaildViewController.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import UIKit
import Kingfisher

class DetailedViewController: UIViewController, DetailedViewInput {
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var priceChangeLabel: UILabel!
    @IBOutlet weak var openLabel: UILabel!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var priceChangeNameLabel: UILabel!
    @IBOutlet weak var openNameLabel: UILabel!
    @IBOutlet weak var lowNameLabel: UILabel!
    @IBOutlet weak var highNameLabel: UILabel!
    
    var stock: Stock?
    var output: DetailedViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = DetiledPresenter(view: self)
        output.viewIsReady()
        activityIndicatorView.startAnimating()
    }
    
    func setupInitialState() {
        navigationItem.title = "About \(stock?.symbol ?? "")"
        assignLables()
        priceChangeIndicator()
        getIcon()
    }
    
    func assignLables() {
        companyNameLabel.text = stock?.companyName
        symbolLabel.text = stock?.symbol
        priceLabel.text = stock?.price.description
        cheackOptionalElements()
     }
    
    func cheackOptionalElements() {
        if let priceChange = stock?.priceChange,
           let open = stock?.open,
           let low = stock?.low,
           let high = stock?.high {
            priceChangeLabel.text = priceChange.description
            openLabel.text = open.description
            lowLabel.text = low.description
            highLabel.text = high.description
        } else {
            priceChangeLabel.isHidden = true
            openLabel.isHidden = true
            lowLabel.isHidden = true
            highLabel.isHidden = true
        }
    }
    
    func priceChangeIndicator() {
        guard let price = stock?.priceChange else { return }
        if price < 0 {
            priceChangeLabel.textColor = .red
        } else {
            priceChangeLabel.textColor = #colorLiteral(red: 0, green: 0.5091661811, blue: 0.02552722581, alpha: 1)
        }
    }
    
    func getIcon() {
        activityIndicatorView.startAnimating()
        guard let symbol = stock?.symbol else { return }
        output.getIcon(by: symbol)
    }
    
    func setupIcon(url: URL) {
        iconImageView.kf.setImage(with: url)
        activityIndicatorView.stopAnimating()
        activityIndicatorView.isHidden = true
    }
}
